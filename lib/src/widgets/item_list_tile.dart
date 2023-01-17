import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppItemListTile extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final String title;
  final String subtitle;

  const AppItemListTile({
    super.key,
    required this.onTap,
    required this.onDelete,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon: const Icon(Icons.delete),
        color: Colors.red,
        splashRadius: 20.r,
      ),
      onTap: onTap,
    );
  }
}
