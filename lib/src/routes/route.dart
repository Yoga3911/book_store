import 'package:flutter/material.dart';
import 'package:test_nusantara/src/presentations/pages/auth/login.dart';
import 'package:test_nusantara/src/presentations/pages/auth/register.dart';
import 'package:test_nusantara/src/presentations/pages/book/home.dart';
import 'package:test_nusantara/src/presentations/pages/book/insert_book.dart';
import 'package:test_nusantara/src/presentations/pages/main_page.dart';
import 'package:test_nusantara/src/presentations/pages/book/update_book.dart';

class Routes {
  Routes._();

  static const login = "/auth/login";
  static const register = "/auth/register";
  static const main = "/main";
  static const add = "/home/add";
  static const edit = "/home/edit";

  static final data = <String, WidgetBuilder>{
    login: (_) => const LoginPage(),
    register: (_) => const RegisterPage(),
    main: (_) => const MainPage(),
    add: (_) => const AddBookPage(),
    edit: (_) => const EditBookPage(),
  };
}
