import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
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
}
