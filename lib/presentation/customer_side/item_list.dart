import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/item_create.dart';

class RestaurantScreen extends StatelessWidget {
  final RestaurantController controller = Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Details'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final restaurant = controller.restaurant.value;
          if (restaurant == null) {
            return Center(child: Text('No restaurant found'));
          }
          return ListTile(
            onTap: () {
              Get.to(() => CreateRestaurantScreen());
            },
            title: Text(restaurant.restaurants?.first.name ?? ""),
            subtitle: Text(restaurant.restaurants?.first.description ?? ""),
          );
        }
      }),
    );
  }
}
