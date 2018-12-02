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
  Noticias_bd(1, "BCR dispone norma contra la falsificación de billetes y moneda", "Emiten reglamento para canje de dinero. Medidas entrarán en vigencia para segunda quincena de junio.",
      "assets/image/Noticias/Noticia02.jpg", "hace 6 días"),
  Noticias_bd(2, "PNP desarticuló banda dedicada a falsificar monedas y billetes", "En total se capturó a 14 miembros de la organización criminal conocida como ‘Los Especialistas’. La PNP también allanó una celda del establecimiento penitenciario Miguel Castro Castro, en donde se encontraría uno de los cabecillas. ",
      "assets/image/Noticias/Noticia01.jpg", "hace 16 días"),
  Noticias_bd(3, "Billetes falsos: Fiscalía dispone investigar a organización que operaba en Lima", "Miembros de ‘los injertos del billete falso’ son acusados de la falsificación de al menos 8 millones de euros y dólares",
      "assets/image/Noticias/Noticia03.jpg", "hace 20 días")];

