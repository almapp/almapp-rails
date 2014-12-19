class UCoursesLoader
  require 'net/http'
  require 'nokogiri'

  def initialize
    @sj = Camp.find_by_cid('SJ')
    @cc = Camp.find_by_cid('CC')
    @lc = Camp.find_by_cid('LC')
    @vr = Camp.find_by_cid('VR')
    @or = Camp.find_by_cid('OR')
  end

  def regex(input)
    !!(input =~ /(^[L,M,W,J,V,S,1,2,3,4,5,6,7,8,:,;,a, ,\-]+$)/)
  end

  def get_camp(name)
    case name
      when 'San Joaquin'
        @sj
      when 'Lo Contador'
        @lc
      when 'Casa Central'
        @cc
      when 'Campus Oriente'
        @or
      when 'Villarica'
        @vr
      else
        nil
    end
  end

  def f(short_name)
    AcademicUnity.find_by_short_name(short_name)
  end

  def get_url(period, unity, page)
    "http://admisionyregistros.uc.cl/dara/libcursos/periodo2#{period}/ua#{unity}_#{page}.html"
  end

  def remove_shit_chars(input)
    c = input[0]
    l = input[-1]
    if  c == ' ' || c == '-' || c == '('
      remove_shit_chars(input[1..input.length-1])
    elsif l == ')'
      remove_shit_chars(input[0..input.length-2])
    else
      input
    end
  end

  def log_puts(content)
    path = "log.txt"
    File.open(path, "w+") do |f|
      f.write(content)
    end
  end

  def relations
    # {UNITY : Faculty}
    r = Hash.new
    #r[91] = f('Antropología') Same as Sociologia
    r[11] = f('Agronomía e Ingeniería Forestal')
    r[94] = f('Arquitectura')
    r[33] = f('Arte')
    r[2] = f('Astrofísica')
    r[12] = f('Ciencias Biológicas')
    r[16] = f('Ciencias de la Salud')
    r[5] = f('Ciencias Económicas y Administrativas')
    r[45] = f('Ciencia Política')
    #r[9] = f('College') Diferent layout http://admisionyregistros.uc.cl/dara/libcursos/periodo21/ua94_3.html
    r[28] = f('Comunicaciones')
    r[1] = f('Construcción Civil')
    r[17] = f('Derecho')
    r[59] = f('Diseño')
    r[20] = f('Educación')
    r[13] = f('Enfermería')
    r[51] = f('Estética')
    r[95] = f('Estudios Urbanos y Territoriales')
    r[67] = f('Filosofía')
    r[3] = f('Física')
    r[57] = f('Geografía')
    r[56] = f('Historia')
    r[4] = f('Ingeniería')
    r[64] = f('Letras')
    r[6] = f('Matemática')
    r[14] = f('Medicina')
    r[70] = f('Música')
    r[15] = f('Odontología')
    r[29] = f('Psicología')
    r[10] = f('Química')
    r[91] = f('Sociología')
    r[34] = f('Teatro')
    r[38] = f('Teología')
    r[30] = f('Trabajo Social')
    r[21] = f('Villarrica')
    return r
  end

  def get_website(url)
    url = URI.parse(url)
    req = Net::HTTP.new(url.host, url.port)
    req.get(url.path)
  end

  def load_courses(year, semester)
    relations_array = relations
    relations_array.each do |number, unity|
      keep_going = true
      page =
      puts '====================================='
      puts "== Unity: #{unity.short_name} (#{number})"
      puts '====================================='
      while keep_going
        url = get_url(semester, number, page)
        web = get_website(url)
        if web.code == '200'
          puts '====================================='
          puts 'Valid URL: '.concat(url)
          html = web.body
          doc = Nokogiri::HTML(html)
          title = remove_shit_chars(doc.xpath('//body/table/tr/td/font/b/font').text)

          unity.name = title.titleize
          unity.save

          table = doc.xpath('//body/table/tr[9]/td/table/tr')
          doc = nil
          table = table[2..table.size] # Remove table titles
          table.each do |cell|
            attributes = cell.xpath('td')
            puts '///////////////////////////////'
            puts "// Number: #{attributes[0].text}"

            initial = attributes[1].text
            course = Course.find_by_initials(initial)
            if course.present?
              puts 'Course found: '.concat(course.initials)
            else
              credits = remove_shit_chars(attributes[3].text)
              name = remove_shit_chars(attributes[4].text)
              course = Course.create(initials: initial,
                                     name: name,
                                     credits: credits,
                                     academic_unity: unity)
              puts 'Course not found, created: '.concat(course.inspect)
            end

            section_number = remove_shit_chars(attributes[2].text)
            section = Section.find_by_course_id_and_year_and_semester_and_number(course.id, year, semester, section_number)
            if section.present?
              puts 'Section found: '.concat(section.identifier)
            else
              section = Section.create(course: course,
                                       year: year,
                                       semester: semester,
                                       number: section_number)
              puts 'Section not found, created: '.concat(section.identifier)
            end

            #slots_min = remove_blank_prefix(attributes[5].text)
            #slots_opt = remove_blank_prefix(attributes[6].text)
            #slots_ofg = remove_blank_prefix(attributes[7].text)

            teachers = attributes[8].xpath('font')
            teachers.children.each do |t|
              if t.text?
                t_name = remove_shit_chars(t.text)
                if t_name.downcase == 'sin profesores' || t_name.downcase == 'por definir'
                  puts course.name.concat(' has no teachers.')
                else
                  teacher = Teacher.find_by_academic_unity_id_and_name(unity.id, t_name)
                  if teacher.present?
                    puts 'Teacher found: '.concat(teacher.name)
                  else
                    teacher = Teacher.create(name: t_name,
                                             academic_unity: unity)
                    puts 'Teacher not found, created: '.concat(teacher.name)
                  end
                  section.teachers << teacher
                end
              end
            end
            section.save
            puts section.inspect

            schedules = attributes[9].xpath('font').children
            module_types = attributes[10].xpath('font').children
            classrooms = attributes[11].xpath('font').children
            campus = remove_shit_chars(attributes[12].xpath('font').children.first.text) rescue ''

            for i in 0..module_types.length-1 do
              if module_types[i].text?
                module_type = remove_shit_chars(module_types[i].text) rescue ''
                module_block = remove_shit_chars(schedules[i].text) rescue ''
                module_place = remove_shit_chars(classrooms[i].text) rescue ''

                puts '-------------'
                puts 'Vars:'
                puts 'Unity: '.concat(unity.short_name)
                puts 'Course: '.concat(section.identifier)
                puts 'Module type: '.concat(module_type)
                puts 'Module blocks: '.concat(module_block)
                puts 'Campus: '.concat(campus)
                puts 'Place: '.concat(module_place)

                alt_place = ''
                c_array = module_place.split(': ')
                if c_array.size == 2
                  module_place = remove_shit_chars(c_array[1])
                  alt_place = remove_shit_chars(c_array[0])
                end

                puts 'Final Place: '.concat(module_place)
                puts '-------------'

                #if camp.present?
                #  place = Place.find_by_insensitive_pid_and_camp_id(module_place, camp.id)
                #else
                #  place = Place.find_by_insensitive_pid(module_place)
                #end

                if module_block.present? && regex(module_block)
                  matches = ScheduleModule.modules_for_loader(module_block)
                  matches.each do |s|
                    p = ScheduleItem.create(class_type: module_type,
                                            section: section,
                                            place_name: module_place,
                                            camp_name: campus,
                                            schedule_module: s)
                    puts "Created item: #{section.identifier} | #{module_type} | #{s.initials} | #{module_place} @ #{campus}"
                  end
                else
                  p = ScheduleItem.create(class_type: module_type,
                                          section: section,
                                          place_name: module_place,
                                          camp_name: campus,
                                          schedule_module: nil)
                  puts "Created item: #{section.identifier} | #{module_type} | No ModuleBlock | #{module_place} @ #{campus}"
                end
              end
            end
          end
          page += 1
        else
          puts '====================================='
          puts 'Url not valid: '.concat(url)
          keep_going = false
        end
      end
    end
  end
end