import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessDialog() {
  Get.dialog(AlertDialog(
    title: Text("Success"),
    content: Text("Successfully Added"),
  ));
}
