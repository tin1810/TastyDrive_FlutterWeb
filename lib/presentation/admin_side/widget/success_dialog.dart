import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessDialog(String text) {
  Get.dialog(AlertDialog(
    title: Text("Success"),
    content: Text(text),
  ));
}
