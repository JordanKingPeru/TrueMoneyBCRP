class Billete {
  const Billete(this.id, this.name, this.description, this.imagePath,
      this.denominaciones);

  final int id;
  final String name;
  final String description;
  final String imagePath;
  final List<Denominacion> denominaciones;
}

class Denominacion {
  const Denominacion(this.id, this.name, this.description, this.imagePath,this.tipoVerificaciones);

  final int id;
  final String name;
  final String description;
  final String imagePath;
  final List<TipoVerificacion> tipoVerificaciones;
}

class TipoVerificacion {
  const TipoVerificacion(this.name, this.description, this.verificaciones);
  final String name;
  final String description;
  final List<Verificacion> verificaciones;
}

class Verificacion{
  const Verificacion(this.name,this.description,this.imagesPath);
  final String name;
  final String description;
  final List<String> imagesPath;
}

const List<Billete> billetes = <Billete>[
  Billete(1, "20 Soles", "Es el billete de menor denominación",
      "assets/image/20_carrusel.jpg", <Denominacion>[
    Denominacion(1, "Primero", "Salio Primerito", "assets/image/20_v1.jpg",
      <TipoVerificacion>[
        TipoVerificacion("Anverso","Revise el anverso del billete",
          <Verificacion>[
            Verificacion("Mire","Mire el billete",<String>["assets/image/20_v3MIRE_verificacion3.jpg"]),
            Verificacion("Gire","Gire el billete",<String>["assets/image/20_v3GIRE_verificacion1.jpg"]),
            Verificacion("Toque","Toque el billete",<String>["assets/image/20v3_TOQUE_verificacion1.jpg"])
          ]
        ),
        TipoVerificacion("Reverso","Revise el reverso del billete",
            <Verificacion>[
              Verificacion("Gire","Gire el billete",<String>["assets/image/IMG_20_REVERSO.jpg"]),
              Verificacion("Mire","Mire el billete",<String>["assets/image/IMG_20_REVERSO.jpg"]),
              Verificacion("Toque","Toque el billete",<String>["assets/image/IMG_20_REVERSO.jpg"])
            ]
        )
      ]
    ),
    Denominacion(2, "Segundo", "Salio Segundo", "assets/image/20_v2.jpg",
        <TipoVerificacion>[]),
    Denominacion(3, "Primero", "Salio Tercero", "assets/image/20_v3.jpg",
        <TipoVerificacion>[])
  ]),
  Billete(2, "100 Soles", "Es el billete de mayor denominación",
      "assets/image/100_carrusel.jpg", <Denominacion>[
        Denominacion(4, "Primero", "Salio Primerito", "assets/image/100_v1.jpg",
            <TipoVerificacion>[]),
        Denominacion(5, "Segundo", "Salio Segundo", "assets/image/100_v2.jpg",
            <TipoVerificacion>[]),
        Denominacion(6, "Primero", "Salio Tercero", "assets/image/100_v3.jpg",
            <TipoVerificacion>[])
      ])
];

const List<Billete> monedas = <Billete>[
];

getDenominacion(id){
  for(Billete billete in billetes){
    for(Denominacion denominacion in billete.denominaciones){
      if(denominacion.id == id){
        return denominacion;
      }
    }
  }
  for(Billete billete in monedas){
    for(Denominacion denominacion in billete.denominaciones){
      if(denominacion.id == id){
        return denominacion;
      }
    }
  }
  return null;
}

getMoneda(id){
  for(Billete billete in billetes){
      if(billete.id == id){
        return billete;
      }
  }
  for(Billete billete in monedas){
    if(billete.id == id){
      return billete;
    }
  }
  return null;
}
/*
const List<Billete> billetes = <Billete>[
  Billete(
      id : 1,
      name: "20 Soles",
      description: "Es el billete de menor denominación",
      imagePath: "assets/images/10soles.png",
      denominaciones: <Denominacion>[

      ]),
  Billete(
      name: "20 Soles",
      description: "Es el billete de 20 solcitos",
      imagePath: "assets/images/10soles.png",
      imagePackage: _kGalleryAssetsPackage),
  Billete(
      name: "50 Soles",
      description: "50 gg",
      imagePath: "assets/images/10soles.png",
      imagePackage: _kGalleryAssetsPackage),
  Billete(
      name: "100 Soles",
      description: "billete del meme",
      imagePath: "assets/images/10soles.png",
      imagePackage: _kGalleryAssetsPackage),
  Billete(
      name: "200 Soles",
      description: "Santa Rosita uff",
      imagePath: "assets/images/10soles.png",
      imagePackage: _kGalleryAssetsPackage),
];*/
