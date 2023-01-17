import 'package:flutter/material.dart';
import 'package:test_nusantara/src/data/models/user/register_model.dart';

import '../../../data/repositories/user/user_repository.dart';

class RegisterProvider with ChangeNotifier {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController pass1Controller;
  late final TextEditingController pass2Controller;
  late final UserRepository userRepository;
  late bool _isAgree;

  RegisterProvider() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    pass1Controller = TextEditingController();
    pass2Controller = TextEditingController();
    userRepository = UserRepository();
    _isAgree = false;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pass1Controller.dispose();
    pass2Controller.dispose();
    super.dispose();
  }

  set setAgree(bool val) {
    _isAgree = val;
    notifyListeners();
  }

  bool get getAgree => _isAgree;

  Future<bool> register({required RegisterModel model}) async {
    return await userRepository.register(model: model);
  }
}
