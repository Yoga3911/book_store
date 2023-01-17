import 'package:flutter/material.dart';

import '../../../data/models/user/login_model.dart';
import '../../../data/repositories/user/user_repository.dart';

class LoginProvider with ChangeNotifier {
  late final UserRepository userRepository;
  late final TextEditingController emailController;
  late final TextEditingController passController;

  LoginProvider() {
    emailController = TextEditingController();
    passController = TextEditingController();
    userRepository = UserRepository();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future<bool> login({required LoginModel model}) async {
    return await userRepository.login(model: model);
  }
}
