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
    description: nil,
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
    description: nil,
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
    description: nil,
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
    description: nil,
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
    description: nil,
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