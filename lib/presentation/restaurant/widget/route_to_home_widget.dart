import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/home/home_page.dart';
import 'package:tasty_drive_website/responsive.dart';

class RouteToHomeWidget extends StatelessWidget {
  const RouteToHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 16 : 50),
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              Get.to(() => HomePage());
            },
            child: Text(
              "Home",
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          Text(
            "Restaurants",
            style: GoogleFonts.poppins(
                fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
