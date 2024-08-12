import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DishController extends GetxController {
  var isSpicy = false.obs;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();

  void toggleIsSpicy(bool value) {
    isSpicy(value);
  }
}
