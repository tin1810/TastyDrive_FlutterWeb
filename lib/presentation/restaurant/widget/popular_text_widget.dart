import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/responsive.dart';

class PopularTitleTextWidget extends StatelessWidget {
  const PopularTitleTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 20 : 55,
          vertical: Responsive.isMobile(context) ? 10 : 35),
      child: Text(
        "Popular Restaurants Near You",
        style: GoogleFonts.poppins(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }
}
