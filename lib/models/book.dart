class BookInfo {
  final int id;
  final String name;
  final String imagePath;

  final String writer;

  final String likedBy;
  String bookPath;

  BookInfo(this.id, this.name, this.imagePath, this.writer, this.likedBy, {this.bookPath = "lib/assets/epub/hindi/Vishnu-Purana.epub"});
}
