import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:test_nusantara/src/core/api_url.dart';
import 'package:test_nusantara/src/data/models/user/login_model.dart';
import 'package:test_nusantara/src/data/models/user/register_model.dart';
import 'package:test_nusantara/src/data/models/user/user_model.dart';
import 'package:test_nusantara/src/data/storage/storage.dart';

class UserRepository {
  Future<UserModel?> getUser() async {
    try {
      final token = "Bearer ${await AppStorage.load("token")}";

      final response = await http.get(
        Uri.parse("${ApiUrl.base}/api/user"),
        headers: {
          "Authorization": token,
        },
      );

      if (response.statusCode == 200) {
        final user = UserModel.fromJson(jsonDecode(response.body));

        return user;
      } else {
        log("Error occurred");
        AppStorage.save("error", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      log(e.toString());
      AppStorage.save("error", e.toString());
      rethrow;
    }
  }

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
      AppStorage.save("error", e.toString());
      return false;
    }
  }

  Future<bool> register({
    required RegisterModel model,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.base}/api/register"),
        body: RegisterModel(
          name: model.name,
          email: model.email,
          password: model.password,
          passwordConfirmation: model.passwordConfirmation,
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

  Future<bool> logout() async {
    try {
      final token = "Bearer ${await AppStorage.load("token")}";
      final response = await http
          .delete(Uri.parse("${ApiUrl.base}/api/user/logout"), headers: {
        "Authorization": token,
      });
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
