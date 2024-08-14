import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tasty_drive_website/config/dependency.dart';
import 'package:tasty_drive_website/presentation/admin_side/admin_screen.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/home_page.dart';

void main() async {
  Dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // Initialize EasyLoading
        child = EasyLoading.init()(context, child);

        // Wrap with ResponsiveBreakpoints
        return ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 360, name: 'SMALL_MOBILE'),
            const Breakpoint(start: 361, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        );
      },
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => AdminDashBoardScreen()),
      ],
      // home: AdminDashBoardScreen(),
    );
  }
}
