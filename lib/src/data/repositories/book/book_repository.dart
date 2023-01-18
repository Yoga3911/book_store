import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_nusantara/src/data/models/book/add_book_model.dart';
import 'package:test_nusantara/src/data/models/book/book_model.dart';

import '../../../core/api_url.dart';
import '../../storage/storage.dart';

class BookRepository {
  Future<List<BookModel>> getAll() async {
    try {
      final token = "Bearer ${await AppStorage.load("token")}";
      final response = await http.get(
        Uri.parse("${ApiUrl.base}/api/books"),
        headers: {
          "Authorization": token,
        },
      );

      if (response.statusCode == 200) {
        List<BookModel> data = [];
        for (var item in jsonDecode(response.body)["data"]) {
          final book = BookModel.fromJson(item);
          data.add(book);
        }
        return data;
      } else {
        log("Error occurred");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }

    return [];
  }

  Future<bool> editBook({
    required AddBookModel model,
    required int bookId,
  }) async {
    try {
      final token = "Bearer ${await AppStorage.load("token")}";

      final response = await http.put(
        Uri.parse("${ApiUrl.base}/api/books/$bookId/edit"),
        headers: {
          "Authorization": token,
        },
        body: AddBookModel(
          author: model.author,
          description: model.description,
          isbn: model.isbn,
          pages: model.pages,
          published: model.published,
          publisher: model.publisher,
          subtitle: model.subtitle,
          title: model.title,
          website: model.website,
        ).toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        log("Error occurred");
        AppStorage.save("error", jsonDecode(response.body)["message"]);
        return false;
      }
    } catch (e) {
      log(e.toString());
      AppStorage.save("error", e.toString());
      return false;
    }
  }

  Future<bool> addBook({
    required AddBookModel model,
  }) async {
    try {
      final token = "Bearer ${await AppStorage.load("token")}";

      final response = await http.post(
        Uri.parse("${ApiUrl.base}/api/books/add"),
        headers: {
          "Authorization": token,
        },
        body: AddBookModel(
          author: model.author,
          description: model.description,
          isbn: model.isbn,
          pages: model.pages,
          published: model.published,
          publisher: model.publisher,
          subtitle: model.subtitle,
          title: model.title,
          website: model.website,
        ).toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        log("Error occurred");
        AppStorage.save("error", jsonDecode(response.body)["message"]);
        return false;
      }
    } catch (e) {
      log(e.toString());
      AppStorage.save("error", e.toString());
      return false;
    }
  }
}
