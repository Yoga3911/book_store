import 'package:flutter/material.dart';
import 'package:test_nusantara/src/data/models/book/add_book_model.dart';
import 'package:test_nusantara/src/data/models/book/book_model.dart';
import 'package:test_nusantara/src/data/repositories/book/book_repository.dart';

class AddBookProvider with ChangeNotifier {
  late final BookRepository bookRepository;
  late final TextEditingController isbnController;
  late final TextEditingController titleController;
  late final TextEditingController subtitleController;
  late final TextEditingController authorController;
  late final TextEditingController publishedController;
  late final TextEditingController publisherController;
  late final TextEditingController pagesController;
  late final TextEditingController descriptionController;
  late final TextEditingController websiteController;

  AddBookProvider() {
    isbnController = TextEditingController();
    titleController = TextEditingController();
    bookRepository = BookRepository();
    subtitleController = TextEditingController();
    authorController = TextEditingController();
    publishedController = TextEditingController();
    publisherController = TextEditingController();
    pagesController = TextEditingController();
    descriptionController = TextEditingController();
    websiteController = TextEditingController();
  }

  @override
  void dispose() {
    isbnController.dispose();
    titleController.dispose();
    subtitleController.dispose();
    authorController.dispose();
    publishedController.dispose();
    publisherController.dispose();
    pagesController.dispose();
    descriptionController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  Future<bool> insert({required AddBookModel model}) async {
    return await bookRepository.addBook(model: model);
  }

  Future<bool> update({
    required AddBookModel model,
    required int bookId,
  }) async {
    return await bookRepository.editBook(
      model: model,
      bookId: bookId,
    );
  }

  void fillTextField(BookModel model) {
    isbnController.text = model.isbn ?? "";
    titleController.text = model.title ?? "";
    subtitleController.text = model.subtitle ?? "";
    authorController.text = model.author ?? "";
    publishedController.text = model.published.toString();
    publisherController.text = model.publisher ?? "";
    pagesController.text = model.pages.toString();
    descriptionController.text = model.description ?? "";
    websiteController.text = model.website ?? "";
  }
}
