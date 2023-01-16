import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Setting",
        style: GoogleFonts.poppins(
          color: Colors.white,
        ),
      ),
    );
  }
}
