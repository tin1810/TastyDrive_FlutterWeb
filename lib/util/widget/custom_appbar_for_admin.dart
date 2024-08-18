import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/login.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/login_admin_widget.dart';
import 'package:tasty_drive_website/responsive.dart';

class CustomAppBarAdminPanel extends StatelessWidget
    implements PreferredSizeWidget {
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());

  CustomAppBarAdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 300,
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
            if (!Responsive.isDesktop(context))
              IconButton(
                  onPressed: () {
                    // homeController.openOrCloseDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            const CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage(
                'assets/icons/Tasty.png',
              ),
            ),
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
        Obx(
          () => authController.isAlreadyLogin.value
              ? IconButton(
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
                  icon: Icon(Icons.logout))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: 100,
                    height: 45,
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.white),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return LoginAdminWidget(
                              emailController: authController.emailController,
                              passwordController:
                                  authController.passwordController,
                              onChangeEmail: () {},
                              onChangePassword: () {},
                              onTapLogin: () {
                                authController.loginAdmin();
                                Get.back();
                              },
                            );
                          });
                    },
                  ),
                ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
