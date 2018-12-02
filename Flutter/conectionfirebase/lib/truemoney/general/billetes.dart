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
  const Denominacion(this.id, this.name, this.description, this.imagePath);

  final int id;
  final String name;
  final String description;
  final String imagePath;
}

const List<Billete> billetes = <Billete>[
  Billete(1, "20 Soles", "Es el billete de menor denominación",
      "assets/image/20_carrusel.jpg", <Denominacion>[
    Denominacion(1, "Primero", "Salio Primerito", "assets/image/20_v1.jpg"),
    Denominacion(2, "Segundo", "Salio Segundo", "assets/image/20_v2.jpg"),
    Denominacion(3, "Primero", "Salio Tercero", "assets/image/20_v3.jpg")
  ]),
  Billete(2, "100 Soles", "Es el billete de mayor denominación",
      "assets/image/100_carrusel.jpg", <Denominacion>[
        Denominacion(4, "Primero", "Salio Primerito", "assets/image/100_v1.jpg"),
        Denominacion(5, "Segundo", "Salio Segundo", "assets/image/100_v2.jpg"),
        Denominacion(6, "Primero", "Salio Tercero", "assets/image/100_v3.jpg")
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
