import 'package:flutter/material.dart';
import 'package:test_nusantara/src/data/models/book/book_model.dart';
import 'package:test_nusantara/src/data/repositories/book/book_repository.dart';

class BookProvider with ChangeNotifier {
  late final BookRepository bookRepository;

  BookProvider() {
    bookRepository = BookRepository();
  }

  Future<List<BookModel>> getAll() async {
    return await bookRepository.getAll();
  }

  Future<bool> delete({required int bookId}) async {
    return await bookRepository.deleteBook(bookId: bookId);
  }
}
