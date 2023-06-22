import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeaderText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final CrossAxisAlignment? alignment;
  const CustomHeaderText({
    super.key,
    this.title,
    this.alignment,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    late List<String> t = title!.split(';');
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(t[0],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
            )),
        if (t.length > 1)
          Text(t[1],
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: (fontSize! + 3),
              )),
      ],
    );
  }
}
