import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/about/about_us_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/blog/blog_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/checkout_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/contact/contact_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/home_page.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/home_view_page.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/login.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/login_admin_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/widget/sign_up_dialog.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/hover_icon.dart';
import 'package:tasty_drive_website/responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.put(AuthController());

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 300,
      backgroundColor: Colors.cyan.withOpacity(0.2),
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
                    homeController.openOrCloseDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            const CircleAvatar(
                maxRadius: 30,
                backgroundImage: AssetImage(
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
      title: Responsive.isDesktop(context)
          ? GetBuilder<HomeController>(builder: (controller) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.menuItems.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextButton(
                        onPressed: () {
                          controller.setMenuIndex(index);
                          index = controller.selectedIndex;
                        },
                        child: Text(controller.menuItems[index],
                            style: GoogleFonts.poppins(
                                fontSize:
                                    controller.selectedIndex == index ? 17 : 15,
                                fontWeight: FontWeight.w600,
                                color: controller.selectedIndex == index
                                    ? Colors.green
                                    : Colors.black)),
                      ),
                    ),
                  ));
            })
          : null,
      actions: ResponsiveBreakpoints.of(context).isMobile
          ? [
              authController.isAlreadyLogin.value == true
                  ? InkWell(
                      onTap: () {
                        Get.to(() => const CheckoutScreen());
                      },
                      child: SvgPicture.asset("assets/icons/cart.svg"),
                    )
                  : SizedBox(),
              const SizedBox(width: 10),
              // const Icon(Icons.person),
              const SizedBox(width: 10),
            ]
          : [
              authController.isAlreadyLogin.value == true
                  ? InkWell(
                      onTap: () {
                        Get.to(() => const CheckoutScreen());
                      },
                      child: SvgPicture.asset("assets/icons/cart.svg"),
                    )
                  : SizedBox(),
              const SizedBox(width: 30),
              // const Icon(Icons.person),
              const SizedBox(width: 10),
              Obx(() => authController.isAlreadyLogin.value
                  ? TextButton(
                      onPressed: () {
                        Get.dialog(AlertDialog(
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
                        ));
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
                                  emailController:
                                      authController.emailController,
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
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

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
        authController.isAlreadyLogin.value == false
            ? MaterialButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.green.shade800)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return LoginAdminWidget(
                          emailController: TextEditingController(),
                          passwordController: TextEditingController(),
                          onChangeEmail: () {},
                          onChangePassword: () {},
                          onTapLogin: () {},
                        );
                      });
                },
                child: const Text("Log In"),
              )
            : SizedBox(),
        Padding(
          padding: Responsive.isDesktop(context)
              ? const EdgeInsets.only(right: 40, left: 20)
              : const EdgeInsets.only(right: 2, left: 2),
          child: authController.isAlreadyLogin.value == false
              ? MaterialButton(
                  color: Colors.green.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.black12)),
                  onPressed: () {
                    signupDialog();
                  },
                  child: Text(
                    "SignUp",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )
              : SizedBox(),
        ),
        if (Responsive.isDesktop(context))
          const SizedBox(
            width: 30,
          ),
        authController.isAlreadyLogin.value == true
            ? HoverableIconButton()
            : SizedBox(),
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
