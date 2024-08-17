import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Row(
      children: [
        Text(
          "Hi, ${authController.loginresponse.value?.tastyDriveUsers?.restaurantName}",
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
