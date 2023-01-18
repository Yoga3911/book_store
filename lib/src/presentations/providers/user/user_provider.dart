import 'package:flutter/material.dart';
import 'package:test_nusantara/src/data/models/user/user_model.dart';
import 'package:test_nusantara/src/data/repositories/user/user_repository.dart';

class UserProvider with ChangeNotifier {
  late final UserRepository userRepository;

  UserProvider() {
    userRepository = UserRepository();
  }

  Future<UserModel?> getUser() async {
    return await userRepository.getUser();
  }
}
