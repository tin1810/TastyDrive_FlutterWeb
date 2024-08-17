import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/admin_side/order_screen.dart';
import 'package:tasty_drive_website/presentation/admin_side/user_screen.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/dash_board_menu.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/delivery_widget.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/dishes_widget.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/restaurant_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/side_menu.dart';
import 'package:tasty_drive_website/responsive.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar_for_admin.dart';

class AdminDashBoardScreen extends StatelessWidget {
  const AdminDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final HomeController homeController = Get.find<HomeController>();
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SideMenu(),
      appBar: CustomAppBarAdminPanel(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            DashBoardMenuWidget(width: width, height: height),
          Obx(() {
            if (authController.loginresponse.value?.tastyDriveUsers?.isAdmin ==
                1) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      homeController.selected.value == 0
                          ? const RestaurantWidget()
                          : const UserScreen()
                    ],
                  ),
                ),
              );
            }
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeController.selected.value == 0
                        ? const DeliveryWidget()
                        : homeController.selected.value == 1
                            ? const OrderScreen()
                            : const DishesWidget()
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
