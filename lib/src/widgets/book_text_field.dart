import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_color.dart';

class AppBookTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  const AppBookTextField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  State<AppBookTextField> createState() => _AppBookTextFieldState();
}

class _AppBookTextFieldState extends State<AppBookTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        validator: (value) {
          if (value == "") {
            return "Field can't null";
          }
          return null;
        },
        controller: widget.controller,
        cursorColor: AppColor.primary,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: AppColor.primary,
            ),
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(20.h),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
