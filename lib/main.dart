import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/presentation/about/about_us_screen.dart';
import 'package:tasty_drive_website/presentation/checkout/checkout_screen.dart';
import 'package:tasty_drive_website/presentation/home/home_view_page.dart';
import 'package:tasty_drive_website/presentation/restaurant/all_restaurant.dart';
import 'package:tasty_drive_website/presentation/home/home_page.dart';
import 'package:tasty_drive_website/presentation/restaurant/restaurant_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveBreakpoints.builder(
              breakpoints: [
                const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
                const Breakpoint(start: 361, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
              child: child!,
            ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => HomePage()),
        ],
        home: HomePage());
  }
}
