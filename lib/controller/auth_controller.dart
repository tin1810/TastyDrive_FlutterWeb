import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/web.dart';
import 'package:tasty_drive_website/model/login_response_model.dart';
import 'package:tasty_drive_website/model/register_response_model.dart';
import 'package:tasty_drive_website/model/user_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:tasty_drive_website/presentation/admin_side/admin_screen.dart';

class AuthController extends GetxController {
  final ItemService _itemService = ItemService();
  late TextEditingController userNameController;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  final _logger = Logger();
  var isLoading = true.obs;
  var isObscure = true.obs;
  var isAlreadyLogin = false.obs;
  var loginresponse = Rx<LoginResponseModel?>(null);
  var userModel = Rx<UserModel?>(null);
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();

    userNameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    checkUserLoginStatus();
    fetchUsers();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  void checkUserLoginStatus() {
    var box = Hive.box('userBox');
    var userId = box.get('userId');

    if (userId != null) {
      isAlreadyLogin.value = true;
    } else {
      isAlreadyLogin.value = false;
    }
  }

  void fetchUsers() async {
    try {
      isLoading.value = true;
      userModel.value = await _itemService.getUsers();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter both email and password.');
    }

    String emailPattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(emailController.text)) {
      Get.snackbar('Error', 'Please enter a valid email address.');
      return;
    }

    try {
      isLoading.value = true;
      LoginResponseModel response = await _itemService.login(
          email: emailController.text, password: passwordController.text);

      if (response.status == 'login success') {
        var box = Hive.box('userBox');
        box.put('userId', response.tastyDriveUsers?.id);

        box.put('isAlreadyLogin', true);
        isAlreadyLogin.value = true;
        loginresponse.value = response;
        if (response.tastyDriveUsers?.isAdmin == 1 ||
            response.tastyDriveUsers?.isRestaurantAdmin == 1) {
          Get.offAll(() => const AdminDashBoardScreen());
        }
        _logger.i(response);
        Get.snackbar('Success', 'Login Success');
        // Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void loginAdmin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter both email and password.');
    }

    String emailPattern =
        r'^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(emailController.text)) {
      Get.snackbar('Error', 'Please enter a valid email address.');
      return;
    }

    try {
      isLoading.value = true;
      LoginResponseModel response = await _itemService.login(
          email: emailController.text, password: passwordController.text);

      if (response.status == 'login success') {
        var box = Hive.box('userBox');
        box.put('userId', response.tastyDriveUsers?.id);

        box.put('isAlreadyLogin', true);
        isAlreadyLogin.value = true;
        loginresponse.value = response;

        _logger.i(response);
        Get.snackbar('Success', 'Login Success');
        Get.back();
        // Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  registerForRestaurants({
    required String resName,
    required String email,
    required String password,
    required String name,
    required String userName,
    required String phone,
    required String address,
  }) async {
    try {
      isLoading.value = true;
      RegisterResponseModel response = await _itemService.registerForRes(
          name: name,
          userName: userName,
          email: email,
          password: password,
          address: address,
          isCustomer: 0,
          isResAdmin: 1,
          isAdmin: 0,
          resName: resName);

      if (response.status == 'success') {
        var box = Hive.box('userBox');
        box.put('userId', response.users?.id);

        box.put('isAlreadyLogin', true);
        isAlreadyLogin.value = true;

        _logger.i(response);
        // Get.snackbar('Success', 'Register Success');
        // Get.offAllNamed('/home');
      } else {
        // Get.snackbar('Error', 'Failed to Register');
      }
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void register() async {
    try {
      isLoading.value = true;
      RegisterResponseModel response = await _itemService.register(
          name: nameController.text,
          userName: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
          phNo: phoneController.text,
          address: addressController.text,
          isCustomer: 1,
          isResAdmin: 0,
          isAdmin: 0,
          location: "",
          time: "",
          distance: "",
          description: "",
          resName: "");
      if (response.status == 'success') {
        var box = Hive.box('userBox');
        box.put('userId', response.users?.id);

        box.put('isAlreadyLogin', true);
        isAlreadyLogin.value = true;

        _logger.i(response);
        Get.snackbar('Success', 'Register Success');
        // Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Failed to Register');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    var box = Hive.box('userBox');

    box.delete('userId');
    box.delete('isAlreadyLogin');

    isAlreadyLogin.value = false;

    emailController.text = "";
    passwordController.text = "";
    Get.snackbar("Logout", "Logout Successfully");

    update();
  }

  void deleteUser(int id) async {
    try {
      await _itemService.deleteUser(id); // Use the deleteItem method

      // If the deletion was successful, remove the item from the local list
      userModel.value?.users?.removeWhere((item) => item.id == id);
      userModel.refresh(); // Refresh the list to update the UI
      Get.snackbar('Success', 'Successfully Deleted User');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
