import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/about/about_us_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/blog/blog_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/checkout_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/contact/contact_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/home_view_page.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/best_in_town.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/header_banner.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/service_section.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/side_menu.dart';
import 'package:tasty_drive_website/responsive.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      key: homeController.scaffoldkey,
      drawer: SideMenu(),
      appBar: CustomAppBar(),
      body: Obx(() {
        switch (homeController.selectedIndex) {
          case 0:
            return HomeViewPage();
          case 1:
            return AboutUsScreen();
          case 2:
            return ContactScreen();
          case 3:
            return BlogScreen();
          default:
            return CheckoutScreen();
        }
      }),
    );
  }
}
