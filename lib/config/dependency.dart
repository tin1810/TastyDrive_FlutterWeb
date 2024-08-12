import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/controller/restaurant_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/home_page.dart';

class Dependency {
  static init() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
