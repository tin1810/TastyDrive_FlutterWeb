import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/responsive.dart';

class DetailTextWidget extends StatelessWidget {
  final String name;
  final bool hasIcon;
  const DetailTextWidget({
    super.key,
    required this.name,
    required this.hasIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Responsive.isMobile(context)
              ? 10
              : Responsive.isTablet(context)
                  ? 30
                  : 50,
          top: 20),
      child: Row(
        children: [
          hasIcon == true
              ? const Icon(
                  Icons.local_fire_department,
                  color: Colors.amber,
                )
              : const SizedBox(),
          const SizedBox(
            width: 5,
          ),
          Text(
            name,
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
