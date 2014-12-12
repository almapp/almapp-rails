puts('Creating faculties')

# Source: http://www.uc.cl/es/facultades-y-unidades-academicas

### Template:
# Faculty.create(
#     fid: '',
#     name: '',
#     short_name: '',
#     camp_id: nil,
#     address: '',
#     url: nil,
#     facebook: nil,
#     twitter: nil,
#     phone: nil,
#     email: nil,
#     description: nil,
#     latitude: 0.0, 
#     longitude: 0.0,
#     icon: 'faculty_.png',
#     zoom: 0,
#     angle: 0,
#     tilt: 0
# )

Faculty.create(
    fid: 'AGC',
    name: 'Facultad de Agronomía e Ingeniería Forestal',
    short_name: 'Agronomía e Ingeniería Forestal',
    camp_id: @sj.id,
    address: '',
    url: 'http://agronomia.uc.cl/',
    facebook: 'https://www.facebook.com/faifuc',
    twitter: 'https://twitter.com/AgroyForestalUC',
    phone: '(56 2) 2354 4895',
    email: 'agroforestal@uc.cl',
    description: nil,
    latitude: -33.496591,
    longitude: -70.609579,
    icon: 'faculty_agc.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'FADEU',
    name: 'Facultad de Arquitectura, Diseño y Estudios Urbanos',
    short_name: 'Arquitectura, Diseño y Estudios Urbanos',
    camp_id: @lc.id,
    address: '',
    url: 'http://fadeu.puc.cl/',
    facebook: 'https://www.facebook.com/fadeuuc',
    twitter: 'https://twitter.com/FADEU_UC',
    phone: '(56) (2) 2354 7750',
    email: 'fadeu@uc.cl',
    description: 'Facultad de Arquitectura, Diseño y Estudios Urbanos de la Pontificia Universidad Católica de Chile.\nLa facultad está compuesta por 3 unidades: la Escuela de Arquitectura, la Escuela de Diseño y el Instituto de Estudios Urbanos.',
    latitude: -33.419495,
    longitude: -70.618351,
    icon: 'faculty_fadeu.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'ART',
    name: 'Facultad de Artes',
    short_name: 'Artes',
    camp_id: @co.id,
    address: 'Avda. Jaime Guzmán Errázuriz 3300, Providencia, Santiago, Chile.',
    url: 'http://artes.uc.cl/',
    facebook: 'https://www.facebook.com/ExtensionFacultadArtesUC',
    twitter: 'https://twitter.com/@facartesuc',
    phone: '+562 2354 2000',
    email: 'mjleon@uc.cl',
    description: 'Somos una red dedicada a generar espacios diálogo y comunicar las actividades de los estudiantes, egresados y profesores de la Facultad de Artes UC y de otros núcleos de desarrollo artístico en Chile. Escríbenos a mjleon@uc.cl',
    latitude: -33.446092,
    longitude: -70.593395,
    icon: 'faculty_art.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'BIO',
    name: 'Facultad de Ciencias Biológicas',
    short_name: 'Ciencias Biológicas',
    camp_id: @cc.id,
    address: '',
    url: 'http://biologia.uc.cl/es/',
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: 'decanato@bio.puc.cl',
    description: nil,
    latitude: -33.441677,
    longitude:  -70.639494,
    icon: 'faculty_bio.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'ECO',
    name: 'Facultad de Ciencias Económicas y Administrativas',
    short_name: 'Ciencias Económicas y Administrativas',
    camp_id: @sj.id,
    address: '',
    url: 'http://economiayadministracion.uc.cl/',
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: nil,
    latitude: -33.497020,
    longitude: -70.611462,
    icon: 'faculty_eco.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'SOC',
    name: 'Facultad de Ciencias Sociales',
    short_name: 'Ciencias Sociales',
    camp_id: @sj.id,
    address: '',
    url: nil,
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: nil,
    latitude: -33.498357,
    longitude: -70.610006,
    icon: 'faculty_soc.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'COM',
    name: 'Facultad de Comunicaciones',
    short_name: 'Comunicaciones',
    camp_id: @cc.id,
    address: '',
    url: 'http://comunicaciones.uc.cl/',
    facebook: 'https://www.facebook.com/fcomuc',
    twitter: 'https://twitter.com/fcomuc',
    phone: '(56-2) 23542020',
    email: 'fcomunicaciones@uc.cl',
    description: nil,
    latitude: -33.441442,
    longitude: -70.640749,
    icon: 'faculty_com.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'LET',
    name: 'Facultad de Letras',
    short_name: 'Letras',
    camp_id: @sj.id,
    address: '',
    url: 'http://www7.uc.cl/letras/',
    facebook: 'https://www.facebook.com/letrasuc',
    twitter: nil,
    phone: '223542000',
    email: nil,
    description: nil,
    latitude: -33.496700,
    longitude: -70.613790,
    icon: 'faculty_let.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'DEC',
    name: 'Facultad de Derecho',
    short_name: 'Derecho',
    camp_id: @cc.id,
    address: '',
    url: 'http://derecho.uc.cl/',
    facebook: 'https://www.facebook.com/derechouc',
    twitter: 'https://twitter.com/derechouc',
    phone: '(56) (2) 2 354 2000',
    email: 'comunicacionesderechouc@uc.cl',
    description: nil,
    latitude: -33.441022,
    longitude: -70.640158,
    icon: 'faculty_dec.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'EDU',
    name: 'Facultad de Educación',
    short_name: 'Educación',
    camp_id: @sj.id,
    address: '',
    url: 'http://educacion.uc.cl/',
    facebook: nil,
    twitter: nil,
    phone: '+56 (2) 22354 5350',
    email: 'educacionuc@uc.cl',
    description: nil,
    latitude: -33.498128,
    longitude: -70.614241,
    icon: 'faculty_edu.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'FIL',
    name: 'Facultad de Filosofía',
    short_name: 'Filosofía',
    camp_id: @sj.id,
    address: '',
    url: nil,
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: nil,
    latitude: -33.497217,
    longitude: -70.613997,
    icon: 'faculty_fil.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'FIS',
    name: 'Facultad de Física',
    short_name: 'Física',
    camp_id: @sj.id,
    address: '',
    url: 'http://fisica.uc.cl/',
    facebook: nil,
    twitter: nil,
    phone: '(56) (2) 354 4470',
    email: nil,
    description: nil,
    latitude: -33.499441,
    longitude: -70.611044,
    icon: 'faculty_fis.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'HIS',
    name: 'Facultad de Historia, Geografía y Ciencia Política',
    short_name: 'Historia, Geografía y Ciencia Política',
    camp_id: @sj.id,
    address: '',
    url: 'http://www7.uc.cl/historiageografiaycienciapolitica/',
    facebook: nil,
    twitter: nil,
    phone: '3547808',
    email: nil,
    description: nil,
    latitude: -33.497075,
    longitude: -70.613188,
    icon: 'faculty_his.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'CCL',
    name: 'Escuela de Construcción Civil',
    short_name: 'Construcción Civil',
    camp_id: @sj.id,
    address: '',
    url: 'http://www7.uc.cl/construc_civil',
    facebook: nil,
    twitter: nil,
    phone: '6864565',
    email: 'webeccuc@uc.cl',
    description: nil,
    latitude: -33.498969,
    longitude: -70.613837,
    icon: 'faculty_ccl.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'ING',
    name: 'Escuela de Ingeniería',
    short_name: 'Ingeniería',
    camp_id: @sj.id,
    address: '',
    url: 'http://www.ing.puc.cl/',
    facebook: 'https://www.facebook.com/EscueladeIngenieriaUniversidadCatolica',
    twitter: 'https://twitter.com/ingenieriaUC',
    phone: '+56 2 354 11 93',
    email: 'comunicaciones@ing.puc.cl',
    description: nil,
    latitude: -33.500000,
    longitude: -70.612870,
    icon: 'faculty_ing.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'MAT',
    name: 'Facultad de Matemática',
    short_name: 'Matemática',
    camp_id: @sj.id,
    address: 'Edificio Rolando Chuaqui. Facultad de Matemáticas. Avda. Vicuña Mackenna #4860. Macul, Santiago. Chile.',
    url: 'http://www.mat.uc.cl/',
    facebook: nil,
    twitter: nil,
    phone: '(56 2) 354 4511',
    email: nil,
    description: nil,
    latitude: -33.499796,
    longitude: -70.610610,
    icon: 'faculty_mat.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'ENF',
    name: 'Escuela de Enfermería',
    short_name: 'Enfermería',
    camp_id: @sj.id,
    address: '',
    url: nil,
    facebook: 'https://www.facebook.com/escueladeenfermeria.uc',
    twitter: 'https://twitter.com/Enfermeria_UC',
    phone: '(56-2) 2354 5831',
    email: 'escueladeenfermeria@uc.cl',
    description: nil,
    latitude: -33.498938,
    longitude: -70.613059,
    icon: 'faculty_enf.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'MED',
    name: 'Escuela de Medicina',
    short_name: 'Medicina',
    camp_id: @cc.id,
    address: 'Alameda Libertador Bernardo O´Higgins 340, 8331150 Santiago de Chile',
    url: 'http://medicina.uc.cl/',
    facebook: 'https://www.facebook.com/escuelamedicinauc',
    twitter: nil,
    phone: '(56) (2) 354 2000',
    email: 'escuelamedicina@uc.cl',
    description: nil,
    latitude: -33.441458,
    longitude: -70.640379,
    icon: 'faculty_med.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'QIM',
    name: 'Facultad de Química',
    short_name: 'Química',
    camp_id: @sj.id,
    address: '',
    url: 'http://www.quimica.uc.cl/',
    facebook: nil,
    twitter: nil,
    phone: '(56) (2) 2354 2000',
    email: nil,
    description: nil,
    latitude: -33.499016,
    longitude: -70.611008,
    icon: 'faculty_qim.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'TTF',
    name: 'Facultad de Teología',
    short_name: 'Teología',
    camp_id: @sj.id,
    address: '',
    url: 'http://teologia.uc.cl/',
    facebook: nil,
    twitter: nil,
    phone: '(56) (2) 2354 1634',
    email: nil,
    description: nil,
    latitude: -33.497833,
    longitude: -70.610808,
    icon: 'faculty_ttf.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'VR',
    name: 'Campus Villarrica',
    short_name: 'Villarrica',
    camp_id: @vr.id,
    address: 'Pontificia Universidad Católica de Chile - Bernardo OHiggins 501 - Villarrica - Chile',
    url: 'http://villarrica.uc.cl/',
    facebook: nil,
    twitter: 'https://twitter.com/villarricauc',
    phone: '(45) 2411830',
    email: nil,
    description: nil,
    latitude: 0.0,
    longitude: 0.0,
    icon: 'faculty_vr.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.create(
    fid: 'D',
    name: 'College',
    short_name: 'College',
    camp_id: @sj.id,
    address: '',
    url: 'http://college.uc.cl/',
    facebook: nil,
    twitter: nil,
    phone: '(56) (2) 2354 5774',
    email: 'contactocollege@uc.cl',
    description: nil,
    latitude: -33.500481,
    longitude: -70.610954,
    icon: 'faculty_d.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Faculty.all.each do |f|
  puts('Created faculty: ' +f.name)
end
