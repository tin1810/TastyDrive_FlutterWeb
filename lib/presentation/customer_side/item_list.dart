import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/item_create.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        if (controller.checkout.value == null) {
          return Center(child: Text('No restaurant found'));
        }
        return ListTile(
          onTap: () {
            Get.to(() => CreateRestaurantScreen());
          },
          title: Text(
            controller.checkout.value?.orders?.first.orderItems?.first.name ??
                "",
          ),
          subtitle: Text(controller.checkout.value?.orders?.first.orderItems
                  ?.first.description ??
              ""
                  ""),
        );
      }
    });
  }
}
