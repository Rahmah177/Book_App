class BookModel {
  final String title, author, cover;
  int? id;

  BookModel({
    this.id,
    required this.title,
    required this.author,
    required this.cover,
  });

  Map<String, dynamic> tomap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'cover': cover,
    };
  }
}
