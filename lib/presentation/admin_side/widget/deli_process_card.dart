import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';

class DeliProcessCardWidget extends StatelessWidget {
  const DeliProcessCardWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController =
        Get.find<CheckoutController>();
    final AuthController authController = Get.find<AuthController>();

    return Obx(() {
      if (checkoutController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        final order = checkoutController.checkout.value;
        if (order == null) {
          return const Center(child: Text('No restaurant found'));
        }

        final name = authController.loginresponse.value?.users?.restaurantName;
        List<OrderItems> allOrderItems = order.orders!
            .expand((order) => order.orderItems ?? <OrderItems>[])
            .where((item) => item.restaurantName == name)
            .toList();

        final pendingOrderItems = allOrderItems
            .where((item) => item.orderStatus == "Pending")
            .toList();

        // Define the count for Pending items
        final pendingCount = pendingOrderItems.length;

        // Now, generate the UI card regardless of the Pending status
        return Row(children: [
          Container(
            height: height * 0.13,
            width: width * 0.2,
            margin: const EdgeInsets.only(right: 5, top: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 246, 165),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/icons/ongoing.png"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pending",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "$pendingCount", // Show the count, which could be 0 if no Pending items
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]);
      }
    });
  }
}

class DeliProcessCardOnGoingWidget extends StatelessWidget {
  const DeliProcessCardOnGoingWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController =
        Get.find<CheckoutController>();
    final AuthController authController = Get.find<AuthController>();

    return Obx(() {
      if (checkoutController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        final order = checkoutController.checkout.value;
        if (order == null) {
          return const Center(child: Text('No restaurant found'));
        }

        final name = authController.loginresponse.value?.users?.restaurantName;
        List<OrderItems> allOrderItems = order.orders!
            .expand((order) => order.orderItems ?? <OrderItems>[])
            .where((item) => item.restaurantName == name)
            .toList();

        final pendingOrderItems = allOrderItems
            .where((item) => item.orderStatus == "OnGoing")
            .toList();

        // Display UI card even if no "OnGoing" items, with length as 0
        return Row(
          children: [
            Container(
              height: height * 0.13,
              width: width * 0.2,
              margin: const EdgeInsets.only(right: 5, top: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 162, 213, 255),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/icons/delivered.png"),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OnGoing",
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${pendingOrderItems.length}", // Display count of "OnGoing" items
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}

class DeliProcessCardCompleteWidget extends StatelessWidget {
  const DeliProcessCardCompleteWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController =
        Get.find<CheckoutController>();
    final AuthController authController = Get.find<AuthController>();
    return Obx(() {
      if (checkoutController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        final order = checkoutController.checkout.value;
        if (order == null) {
          return const Center(child: Text('No restaurant found'));
        }
        final name = authController.loginresponse.value?.users?.restaurantName;
        List<OrderItems> allOrderItems = order.orders!
            .expand((order) => order.orderItems ?? <OrderItems>[])
            .where((item) => item.restaurantName == name)
            .toList();

        final pendingOrderItems = allOrderItems
            .where((item) => item.orderStatus == "Completed")
            .toList();
        return Row(
            children: // First, filter the list to get only the items with orderStatus = "Pending"

// Then, generate the widgets based on the filtered list
                List.generate(1, (index) {
          return Container(
            height: height * 0.13,
            width: width * 0.2,
            margin: EdgeInsets.only(right: 5, top: 20),
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 255, 191, 187)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/icons/completed.png"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Completed",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${pendingOrderItems?.length}",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }));
      }
    });
  }
}
