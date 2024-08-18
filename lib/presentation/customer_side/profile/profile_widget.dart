import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/custom_textfield.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    authController.nameController.text =
        authController.loginresponse.value?.users?.name ?? "";
    authController.emailController.text =
        authController.loginresponse.value?.users?.email ?? "";
    authController.addressController.text =
        authController.loginresponse.value?.users?.address ?? "";
    authController.phoneController.text =
        authController.loginresponse.value?.users?.phone ?? "";
    authController.passwordController.text =
        authController.loginresponse.value?.users?.password ?? "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: CircleAvatar(
            maxRadius: 60,
            backgroundImage: NetworkImage(
                "https://plus.unsplash.com/premium_photo-1723791732457-788311c5da12?q=80&w=2932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Name",
            style:
                GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            width: 500,
            child: CustomTextField(controller: authController.nameController)),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Email",
            style:
                GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            width: 500,
            child: CustomTextField(controller: authController.emailController)),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Phone",
            style:
                GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            width: 500,
            child: CustomTextField(controller: authController.phoneController)),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Address",
            style:
                GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            width: 500,
            child:
                CustomTextField(controller: authController.addressController)),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Password",
            style:
                GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            width: 500,
            child:
                CustomTextField(controller: authController.passwordController)),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: MaterialButton(
              elevation: 0.2,
              height: 60,
              minWidth: 450,
              color: Colors.green.shade100,
              onPressed: () {
                authController.updateUser();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.black12)),
              child: Text("Confirm")),
        )
      ],
    );
  }
}
