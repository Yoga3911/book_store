class BookModel {
  BookModel({
    required this.id,
    required this.userId,
    required this.isbn,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.published,
    required this.publisher,
    required this.pages,
    required this.description,
    required this.website,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? userId;
  final String? isbn;
  final String? title;
  final String? subtitle;
  final String? author;
  final DateTime? published;
  final String? publisher;
  final int? pages;
  final String? description;
  final String? website;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        userId: json["user_id"],
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: DateTime.parse(json["published"]),
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
