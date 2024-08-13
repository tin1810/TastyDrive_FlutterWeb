import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/success_dialog.dart';

class DishController extends GetxController {
  final ItemService _itemService = ItemService();
  final RestaurantController controller = Get.put(RestaurantController());
  var isSpicy = false.obs;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();

  var dish = Rx<DishModel?>(null);
  var isLoading = true.obs;

  void toggleIsSpicy(bool value) {
    isSpicy(value);
  }

  void createDish() async {
    try {
      isLoading.value = true;
      DishModel response = await _itemService.createDish(
          1,
          nameController.text,
          priceController.text,
          descriptionController.text,
          categoryController.text,
          isSpicy.value == true ? 0 : 1);
      if (response.status == 'success') {
        showSuccessDialog();
        // Get.snackbar('Success', 'Restaurant created successfully');
        controller.fetchDishes();
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
