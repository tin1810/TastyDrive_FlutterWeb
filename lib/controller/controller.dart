import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/model/login_response_model.dart';
import 'package:tasty_drive_website/model/register_response_model.dart';
import 'package:tasty_drive_website/model/restaurant_response_model.dart';
import 'package:tasty_drive_website/model/user_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/success_dialog.dart';

class RestaurantController extends GetxController {
  final ItemService _itemService = ItemService();
  var users = Rx<UserModel?>(null);
  // var restaurants = Rx<RestaurantResponseModel?>(null);

  var isLoading = true.obs;
  final AuthController authController = Get.find<AuthController>();

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();
  final distanceController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
    authController.checkUserLoginStatus();
  }

  @override
  void onClose() {
    // nameController.dispose();
    // distanceController.dispose();
    // emailController.dispose();
    // passwordController.dispose();
    // locationController.dispose();
    // descriptionController.dispose();
    // timeController.dispose();

    super.onClose();
  }

  void fetchRestaurants() async {
    try {
      isLoading.value = true;
      users.value = await _itemService.getUsers();
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
        id: id,
        name: nameController.text,
        userName: "",
        email: emailController.text,
        password: passwordController.text,
        phNo: "",
        address: "",
        isCustomer: 0,
        isResAdmin: 1,
        isAdmin: 0,
        location: locationController.text,
        time: timeController.text,
        distance: distanceController.text,
        description: descriptionController.text,
        resName: nameController.text,
      );
      if (response.status == 'success') {
        Get.snackbar('Success', 'Successfully Updated');
        fetchRestaurants();
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
      LoginResponseModel response = await _itemService.register(
        name: nameController.text,
        userName: "",
        email: emailController.text,
        password: passwordController.text,
        phNo: "",
        address: "",
        isCustomer: 0,
        isResAdmin: 1,
        isAdmin: 0,
        location: locationController.text,
        time: timeController.text,
        distance: distanceController.text,
        description: descriptionController.text,
        resName: nameController.text,
      );

      if (response.status == 'success') {
        showSuccessDialog("Successfully Create Restaurant");
        Get.snackbar('Success', 'Successfully Created Restaurant');
        fetchRestaurants();
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void deleteUser(int id) async {
    try {
      await _itemService.deleteRestaurant(id); // Use the deleteItem method
      users.value?.users?.removeWhere((item) => item.id == id);
      users.refresh(); // Refresh the list to update the UI
      Get.snackbar('Success', 'Successfully Deleted User');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void deleteRestaurant(int id) async {
    try {
      await _itemService.deleteRestaurant(id); // Use the deleteItem method
      users.value?.users?.removeWhere((item) => item.id == id);
      users.refresh(); // Refresh the list to update the UI
      Get.snackbar('Success', 'Successfully Deleted Restaurant');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
