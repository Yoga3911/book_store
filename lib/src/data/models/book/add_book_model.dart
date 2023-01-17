class AddBookModel {
  AddBookModel({
    required this.isbn,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.published,
    required this.publisher,
    required this.pages,
    required this.description,
    required this.website,
  });

  final String? isbn;
  final String? title;
  final String? subtitle;
  final String? author;
  final String? published;
  final String? publisher;
  final int? pages;
  final String? description;
  final String? website;

  Map<String, dynamic> toJson() => {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published,
        "publisher": publisher,
        "pages": pages.toString(),
        "description": description,
        "website": website,
      };
}
