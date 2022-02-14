class BookController {
  final int id;
  final String name;
  final String imagePath;

  final String writer;

  final String likedBy;
  final String bookPath = "lib/assets/epub/Agni-Purana.epub" ;

  BookController(this.id, this.name, this.imagePath, this.writer, this.likedBy);
}
