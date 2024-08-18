import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/model/admin_model.dart';
import 'package:tasty_drive_website/model/delivery_card_model.dart';
import 'package:tasty_drive_website/model/home_banner_model.dart';
import 'package:tasty_drive_website/model/order_model.dart';

class HomeController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  var selected = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthController authController = Get.find<AuthController>();
  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems => [
        "Home",
        "About",
        "Blog",
      ];

  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  List<HomeBannerModel> get homeBannerList => [
        HomeBannerModel(
            "assets/icons/24-hour-service-svgrepo-com.svg",
            "24/7 Hours",
            "Support",
            Colors.yellow.shade200,
            Colors.amber,
            Colors.black),
        HomeBannerModel(
          "assets/icons/parcel-icon-svgrepo-com.svg",
          "Free Shipping",
          "Deliver To Door",
          Colors.lightBlue,
          null,
          Colors.white,
        ),
        HomeBannerModel(
            "assets/icons/payment-method-credit-card-svgrepo-com.svg",
            "Easy Payment",
            "Shop With Us",
            Colors.red.shade100,
            null,
            Colors.black),
        HomeBannerModel(
            "assets/icons/discount-svgrepo-com.svg",
            "Big Discount",
            "On Big Menu",
            Color.fromARGB(255, 252, 233, 227),
            null,
            Colors.black),
      ];

  List<AdminModel> get adminList => [
        AdminModel("assets/icons/deliveryman-svgrepo-com.svg", "Restaurant"),
        AdminModel("assets/icons/deliveryman-svgrepo-com.svg", "User"),
      ];
  List<AdminModel> get restaurantAdminList => [
        AdminModel("assets/icons/deliveryman-svgrepo-com.svg", "Delivery"),
        AdminModel("assets/icons/deliveryman-svgrepo-com.svg", "Order"),
        AdminModel("assets/icons/deliveryman-svgrepo-com.svg", "Dishes"),
      ];

  List<AdminModel> get profileList => [
        AdminModel("assets/icons/deliveryman-svgrepo-com.svg", "Profile"),
        AdminModel("assets/icons/deliveryman-svgrepo-com.svg", "Order History"),
      ];

  List<DeliveryCardModel> get deliveryCardList => [
        DeliveryCardModel(
            "Ongoing",
            "2",
            const Color.fromARGB(255, 255, 246, 165),
            "assets/icons/ongoing.png"),
        DeliveryCardModel(
            "Delivered",
            "3",
            const Color.fromARGB(255, 162, 213, 255),
            "assets/icons/delivered.png"),
        DeliveryCardModel(
            "Completed",
            "4",
            const Color.fromARGB(255, 255, 191, 187),
            "assets/icons/completed.png"),
      ];
  List<Order> get orders => [
        Order(
          name: 'Tri Hartono',
          product: 'Chair Comfort',
          variation: 'Variation : 3,d',
          quantity: 8,
          price: 580,
          status: 'Need to be sent',
          deliveryService: 'Jean',
          orderNumber: '20528091A61KY',
        ),
        Order(
          name: 'Yoga Hartono',
          product: 'Chair Comfort',
          variation: 'Variation : 4,d',
          quantity: 4,
          price: 280,
          status: 'Ongoing',
          deliveryService: 'Mavin',
          orderNumber: '20538092K62AY',
        ),
        Order(
          name: 'Fandid Schiffer',
          product: 'Chair Comfort',
          variation: 'Variation : 5,d',
          quantity: 12,
          price: 420,
          status: 'Finished',
          deliveryService: 'Walliam',
          orderNumber: '20548093A63DY',
        ),
      ];

  @override
  void onInit() {
    authController.checkUserLoginStatus();
    super.onInit();
  }

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void changeSelectedIndex(int index) {
    selected.value = index;
    update();
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
    update();
  }
}
