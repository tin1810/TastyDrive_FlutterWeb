import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Hi, Tin ",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 22),
        ),
        Image.asset(
          "assets/icons/goodbye.png",
          height: 30,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
