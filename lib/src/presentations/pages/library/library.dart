import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Library",
        style: GoogleFonts.poppins(
          color: Colors.white,
        ),
      ),
    );
  }
}
