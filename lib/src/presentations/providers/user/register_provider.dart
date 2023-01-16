import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController pass1Controller;
  late final TextEditingController pass2Controller;
  late bool _isAgree;

  RegisterProvider() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    pass1Controller = TextEditingController();
    pass2Controller = TextEditingController();
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
}
