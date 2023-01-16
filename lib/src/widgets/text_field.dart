import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_color.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final bool isSecure;
  final TextEditingController controller;
  final IconData icon;
  const AppTextField({
    super.key,
    required this.hint,
    required this.isSecure,
    required this.controller,
    required this.icon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isNotVisible = true;

  _changeVisible() => setState(() {
        isNotVisible = !isNotVisible;
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isSecure ? isNotVisible : false,
      controller: widget.controller,
      cursorColor: AppColor.primary,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        suffixIcon: widget.isSecure
            ? IconButton(
                onPressed: _changeVisible,
                icon: const Icon(
                  Icons.visibility_rounded,
                  color: Colors.grey,
                ),
              )
            : null,
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
    );
  }
}
