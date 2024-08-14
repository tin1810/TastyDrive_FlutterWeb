import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/controller/dish_controller.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';

class Dependency {
  static init() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => RestaurantController(), fenix: true);
    Get.lazyPut(() => DishController(), fenix: true);
    Get.lazyPut(() => CheckoutController(), fenix: true);
  }
}
