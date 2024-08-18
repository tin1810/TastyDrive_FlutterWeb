import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/login.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/hover_icon.dart';
import 'package:tasty_drive_website/responsive.dart';

class CustomAppBarRestaurant extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return AppBar(
      leadingWidth: 300,
      backgroundColor: Colors.white,
      leading: Container(
        padding: Responsive.isDesktop(context)
            ? const EdgeInsets.only(
                left: 50,
                top: 5,
                bottom: 5,
              )
            : Responsive.isTablet(context)
                ? const EdgeInsets.only(
                    left: 20,
                    top: 5,
                    bottom: 5,
                  )
                : null,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
                maxRadius: Responsive.isDesktop(context) ? 30 : 20,
                backgroundImage: const AssetImage(
                  'assets/icons/Tasty.png',
                )),
            const SizedBox(width: 4), // Adjust space between icon and text
            Flexible(
              child: Text(
                "Tasty Drive",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Obx(() => authController.isAlreadyLogin.value
            ? TextButton(
                onPressed: () {
                  Get.dialog(
                    AlertDialog(
                      title: Text(
                        "Are you sure to logout?",
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 18),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              authController.logout();
                              Get.back();
                            },
                            child: Text(
                              "Yes",
                              style: GoogleFonts.poppins(color: Colors.red),
                            ))
                      ],
                    ),
                  );
                },
                child: Text(
                  "Logout",
                  style: GoogleFonts.poppins(color: Colors.red),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                    left: 8, top: 8, bottom: 8, right: 50),
                child: MaterialButton(
                  minWidth: 120,
                  height: 20,
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Join With Us",
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return LoginViewWidget(
                            emailController: authController.emailController,
                            passwordController:
                                authController.passwordController,
                            onChangeEmail: () {},
                            onChangePassword: () {},
                            onTapLogin: () {
                              authController.login();
                              Get.back();
                            },
                          );
                        });
                  },
                ),
              )),
        if (Responsive.isDesktop(context))
          const SizedBox(
            width: 30,
          ),
        Obx(
          () => authController.isAlreadyLogin.value == true
              ? HoverableIconButton()
              : SizedBox(),
        ),
        if (Responsive.isDesktop(context))
          const SizedBox(
            width: 50,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
