import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/model/restaurant_model.dart';
import 'package:tasty_drive_website/model/restaurant_response_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/success_dialog.dart';

class RestaurantController extends GetxController {
  final ItemService _itemService = ItemService();
  var restaurant = Rx<RestaurantModel?>(null);
  // var restaurants = Rx<RestaurantResponseModel?>(null);

  var isLoading = true.obs;

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();
  final distanceController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  @override
  void onClose() {
    nameController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    distanceController.dispose();
    super.onClose();
  }

  void fetchItems() async {
    try {
      isLoading.value = true;
      restaurant.value = await _itemService.getItems();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void updateRestaurant({
    required int id,
  }) async {
    try {
      isLoading.value = true;
      RestaurantResponseModel response = await _itemService.updateRestaraunt(
        id,
        nameController.text,
        locationController.text,
        descriptionController.text,
        timeController.text,
        distanceController.text,
      );
      if (response.status == 'success') {
        Get.snackbar('Success', 'Successfully Added');
        fetchItems();
        // controller.fetchDishes();
      } else {
        Get.snackbar('Error', 'Failed to Update Restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void createRestaurant() async {
    try {
      isLoading.value = true;
      RestaurantResponseModel response = await _itemService.createItem(
          nameController.text,
          locationController.text,
          descriptionController.text,
          timeController.text,
          distanceController.text);
      if (response.status == 'success') {
        showSuccessDialog();
        // Get.snackbar('Success', 'Restaurant created successfully');
        fetchItems();
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void deleteRestaurant(int id) async {
    try {
      await _itemService.deleteRestaurant(id); // Use the deleteItem method

      restaurant.value?.restaurants?.removeWhere((item) => item.id == id);
      restaurant.refresh(); // Refresh the list to update the UI
      Get.snackbar('Success', 'Successfully Deleted Restaurant');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
