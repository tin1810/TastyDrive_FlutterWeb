import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/controller/image_controller.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/model/dish_response_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/success_dialog.dart';

class DishController extends GetxController {
  final ItemService _itemService = ItemService();
  final RestaurantController controller = Get.put(RestaurantController());
  final AuthController authController = Get.find<AuthController>();
  final ImageUploadController imageUploadController =
      Get.put(ImageUploadController());
  var fileName = "".obs;
  var selectedCategory = ''.obs;
  var isSpicy = false.obs;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();
  var dish = Rx<DishModel?>(null);
  var isLoading = true.obs;
  var unit8List = Rx<Uint8List?>(null);
  @override
  void onInit() {
    fetchDishes();
    authController.checkUserLoginStatus();
    super.onInit();
  }

  void toggleIsSpicy(bool value) {
    isSpicy(value);
  }

  void fetchDishes() async {
    try {
      isLoading.value = true;
      dish.value = await _itemService.getDishes();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void updateSelectedCategory(String category) {
    selectedCategory.value = category;
    update();
  }

  void onPickUpImage(Uint8List bytes, String fileName) {
    unit8List.value = bytes;
    this.fileName.value = fileName;
    update();
  }

  Future<void> createDishWithImage(int id) async {
    try {
      isLoading.value = true;

      DishResponseModel response = await _itemService.createDish(
        id,
        nameController.text,
        priceController.text,
        descriptionController.text,
        selectedCategory.value, // Use selected category
        isSpicy.value == true ? 1 : 0,
      );

      if (response.status == 'success') {
        showSuccessDialog("Successfully Create Dish");
        fetchDishes();
      } else {
        Get.snackbar('Error', 'Failed to create dish');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  // Future<void> createDishWithImage(int id) async {
  //   try {
  //     isLoading.value = true;

  //     DishResponseModel response = await _itemService.createDish(
  //       id,
  //       nameController.text,
  //       priceController.text,
  //       descriptionController.text,
  //       categoryController.text,
  //       isSpicy.value == true ? 1 : 0,
  //     );

  //     if (response.status == 'success') {
  //       showSuccessDialog("Successfully Create Dish");
  //       fetchDishes();
  //     } else {
  //       Get.snackbar('Error', 'Failed to create dish');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void updateDish({
    required int resId,
    required int id,
  }) async {
    try {
      isLoading.value = true;
      DishResponseModel response = await _itemService.updateDish(
          id,
          resId,
          nameController.text,
          priceController.text,
          descriptionController.text,
          categoryController.text,
          isSpicy.value == true ? 0 : 1);
      if (response.status == 'success') {
        showSuccessDialog("Successfully Update Dish");

        fetchDishes();
      } else {
        Get.snackbar('Error', 'Failed to Update Dish');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void deleteDish(int id) async {
    try {
      await _itemService.deleteDish(id); // Use the deleteItem method

      // If the deletion was successful, remove the item from the local list
      dish.value?.dishes?.removeWhere((item) => item.id == id);
      dish.refresh(); // Refresh the list to update the UI
      Get.snackbar('Success', 'Successfully Deleted Dish');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
