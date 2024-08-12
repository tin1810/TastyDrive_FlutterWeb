import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/about/about_us_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/blog/blog_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/checkout_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/home_view_page.dart';

import 'package:tasty_drive_website/presentation/customer_side/home/widget/side_menu.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            return BlogScreen();
          default:
            return CheckoutScreen();
        }
      }),
    );
  }
}
