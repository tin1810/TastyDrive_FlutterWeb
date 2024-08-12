import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void addToCartDialog({required Function onClicked}) {
  Get.dialog(
    barrierDismissible: true,
    AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Center(
          child: Text(
        "Add Item",
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      )),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "Are your sure to add?",
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onClicked();
          },
          child: Text(
            "Yes",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
