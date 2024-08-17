import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/widget/custom_login.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/widget/email_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/widget/password_widget.dart';

void signupDialog() {
  final AuthController authController = Get.put(AuthController());

  Get.dialog(
    AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        width: 500,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(3, 108, 48, 0.882),
              Color.fromRGBO(13, 154, 183, 0.89),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            EmailTextFieldWidget(
              emailController: authController.emailController,
              onChanged: () {
                // widget.onChangeEmail();
              },
            ),
            Obx(() => PasswordTextFieldWidget(
                  onChanged: () {
                    // widget.onChangePassword();
                  },
                  isObscure: authController.isObscure.value,
                  passwordController: authController.passwordController,
                  onPressedVisibleIcon: authController.togglePasswordVisibility,
                )),
            CustomLoginWidget(
              onChanged: () {
                // widget.onChangeEmail();
              },
              controller: authController.nameController,
              name: 'Name',
              hint: "Enter Name",
              validatorText: 'Please enter a name',
              textInputType: TextInputType.name,
              icon: Icons.person,
            ),
            CustomLoginWidget(
              onChanged: () {
                // widget.onChangeEmail();
              },
              controller: authController.userNameController,
              name: 'UserName',
              hint: "Enter UserName",
              validatorText: 'Please enter a username',
              textInputType: TextInputType.text,
              icon: Icons.person,
            ),
            CustomLoginWidget(
              onChanged: () {
                // widget.onChangeEmail();
              },
              controller: authController.phoneController,
              name: 'Phone',
              hint: "Enter Phone",
              validatorText: 'Please enter a phone',
              textInputType: TextInputType.phone,
              icon: Icons.phone,
            ),
            CustomLoginWidget(
              onChanged: () {
                // widget.onChangeEmail();
              },
              controller: authController.addressController,
              name: 'Address',
              hint: "Enter Address",
              validatorText: 'Please enter a address',
              textInputType: TextInputType.text,
              icon: Icons.location_pin,
            ),
            MaterialButton(
              color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              onPressed: () {
                authController.register();
                Get.back();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
