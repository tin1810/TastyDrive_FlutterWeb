import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tasty_drive_website/model/home_banner_model.dart';

class HomeController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems => [
        "Home",
        "About",
        "Contact",
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

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
    update();
  }
}
