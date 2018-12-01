class Billete {
  const Billete(
      {this.name, this.description, this.imagePath, this.imagePackage});

  final String name;
  final String description;
  final String imagePath;
  final String imagePackage;
}

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
const List<Billete> kPestoRecipes = <Billete>[
  Billete(
      name: "10 Soles",
      description: "Es el billete de menor denominación",
      imagePath: "assets/images/10soles.png",
      imagePackage: _kGalleryAssetsPackage),
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
];
