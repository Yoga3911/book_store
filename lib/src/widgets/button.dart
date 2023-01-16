import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isDisable;
  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.isDisable,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisable ? null : onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.maxFinite, 50.h),
        disabledBackgroundColor: Colors.grey,
      ),
      child: Text(title),
    );
  }
}
