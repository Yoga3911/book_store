import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_nusantara/src/core/api_url.dart';
import 'package:test_nusantara/src/data/models/user/login_model.dart';
import 'package:test_nusantara/src/data/storage/storage.dart';

class UserRepository {
  Future<bool> login({
    required LoginModel model,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.base}/api/login"),
        body: LoginModel(email: model.email, password: model.password).toJson(),
      );

      if (response.statusCode == 200) {
        AppStorage.save("token", jsonDecode(response.body)["token"]);
        return true;
      } else {
        log("Error occurred");
        AppStorage.save("error", jsonDecode(response.body)["message"]);
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
