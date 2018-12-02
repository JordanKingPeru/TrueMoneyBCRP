class Noticias_bd {
  const Noticias_bd(this.id, this.titulo, this.description, this.imagePath,
      this.periodo);

  final int id;
  final String titulo;
  final String description;
  final String imagePath;
  final String periodo;
}

const List<Noticias_bd > Noticias = <Noticias_bd>[
  Noticias_bd(1, "PNP desarticuló banda dedicada a falsificar monedas y billetes", "En total se capturó a 14 miembros de la organización criminal conocida como ‘Los Especialistas’. La PNP también allanó una celda del establecimiento penitenciario Miguel Castro Castro, en donde se encontraría uno de los cabecillas. ",
      "assets/image/Noticias/Noticia01.jpg", "has 16 días"),
  Noticias_bd(2, "PNP desarticuló banda dedicada a falsificar monedas y billetes", "En total se capturó a 14 miembros de la organización criminal conocida como ‘Los Especialistas’. La PNP también allanó una celda del establecimiento penitenciario Miguel Castro Castro, en donde se encontraría uno de los cabecillas. ",
      "assets/image/IMG_quinones.jpg", "has 16 días")];

