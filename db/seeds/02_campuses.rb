puts('Creating campuses')

### Template:
# Camp.create(
#     cid: '',
#     name: '',
#     organization_id: @uc.id,
#     address: '',
#     url: nil,
#     facebook: nil,
#     twitter: nil,
#     phone: nil,
#     email: nil,
#     description: nil,
#     coords: '',
#     icon: 'campus_.png',
#     zoom: 0,
#     angle: 0,
#     tilt: 0
# )

@sj = Camp.create(
    cid: 'SJ',
    name: 'San Joaquín',
    organization_id: @uc.id,
    address: 'Av. Vicuña Mackenna 4860, Macul, Chile',
    url: nil,
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: 'Incorporado al patrimonio de la Universidad en 1891, legado de Honoria Gandarillas de la chacra Macul (primera hijuela de Macul e Hijuela San Joaquín) con 82 hás., el actual campus San Joaquín de la Universidad comenzó su implementación como ciudad universitaria en los sesenta y continúa en desarrollo.',
    latitude: -33.498386,
    longitude: -70.611716,
    icon: 'campus_sj.png',
    zoom: 17,
    angle: 90,
    tilt: 30
)

@cc = Camp.create(
    cid: 'CC',
    name: 'Casa Central',
    organization_id: @uc.id,
    address: 'Av. Alameda 340, Santiago, Chile',
    url: nil,
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: 'El edificio principal y fundacional de la Universidad se terminó de construir en 1912. Proyecto original de Ignacio Cremonesi, fue concluido por su discípulo Emilio Jecquier. Por su magnificencia fue denominado Palacio Universitario y desde entonces acoge a la Dirección Superior y a varias facultades.',
    latitude: -33.441543,
    longitude: -70.640407,
    icon: 'campus_cc.png',
    zoom: 17,
    angle: 5,
    tilt: 0
)

@lc = Camp.create(
    cid: 'LC',
    name: 'Lo Contador',
    organization_id: @uc.id,
    address: 'El Comendador 1916, Providencia, Chile',
    url: nil,
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: 'Antigua hacienda del siglo XVIII contemporánea a grandes obras en la ciudad de Santiago como el puente de Calicanto. Su casona es Monumento Nacional y parte del patrimonio arquitectónico de Santiago. Desde 1958 es sede de la Facultad de Arquitectura, Diseño y Estudios Urbanos de la Universidad.',
    latitude: -33.419247,
    longitude: -70.617861,
    icon: 'campus_lc.png',
    zoom: 0,
    angle: 150,
    tilt: 30
)

@co = Camp.create(
    cid: 'OR',
    name: 'Campus Oriente',
    organization_id: @uc.id,
    address: 'Av. Jaime Guzmán Errázuriz 3300, Providencia, Chile',
    url: nil,
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: 'Construido en 1934 y adquirido por la Universidad a la Congregación de las Monjas Francesas en la década de los setenta (1971), acoge a las carreras de la Facultad de Artes y al Instituto de Estética. ',
    latitude: -33.445714,
    longitude: -70.593499,
    icon: 'campus_or.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

@vr = Camp.create(
    cid: 'VR',
    name: 'Villarica',
    organization_id: @uc.id,
    address: 'Bernardo O''Higgins 501, Villarrica, Chile',
    url: nil,
    facebook: nil,
    twitter: nil,
    phone: nil,
    email: nil,
    description: 'Es un edificio de moderna construcción (2001) donde se desarrolla casi toda la actividad relacionada con los programas académicos, dirección y administración.',
    latitude: -39.277704,
    longitude: -72.225615,
    icon: 'campus_.png',
    zoom: 0,
    angle: 0,
    tilt: 0
)

Camp.all.each do |c|
  puts('Created campus: ' +c.name)
end