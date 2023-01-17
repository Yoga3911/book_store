import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_color.dart';

class AppListTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  const AppListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColor.grey,
        ),
        child: Icon(
          icon,
          color: AppColor.primary,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: title != "Logout"
          ? const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            )
          : null,
      onTap: onTap,
    );
  }
}
