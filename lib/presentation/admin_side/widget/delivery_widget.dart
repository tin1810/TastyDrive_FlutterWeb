import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/deli_process_card.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/order_list_header_widget.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/order_tile_widget.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/title_widget.dart';

class DeliveryWidget extends StatelessWidget {
  const DeliveryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final CheckoutController checkoutController =
        Get.find<CheckoutController>();
    final AuthController authController = Get.find<AuthController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(),
          Row(
            children: [
              DeliProcessCardWidget(height: height, width: width),
              DeliProcessCardOnGoingWidget(height: height, width: width),
              DeliProcessCardCompleteWidget(height: height, width: width),
            ],
          ),
          AllWidget(width: width),
          const SizedBox(
            height: 40,
          ),
          OrderListHeader(),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () {
              if (checkoutController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final order = checkoutController.checkout.value;
                if (order == null) {
                  return const Center(child: Text('No restaurant found'));
                }

                final name =
                    authController.loginresponse.value?.users?.restaurantName;
                List<OrderItems> allOrderItems = order.orders!
                    .expand((order) => order.orderItems ?? <OrderItems>[])
                    .where((item) => item.restaurantName == name)
                    .toList();

                final ongoingOrderItems = allOrderItems
                    .where((item) =>
                        item.orderStatus == "OnGoing" ||
                        item.orderStatus == "Completed")
                    .toList();

                if (ongoingOrderItems.isEmpty) {
                  return const Center(
                      child: Text('No OnGoing or Completed orders found'));
                }

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ongoingOrderItems.length,
                  itemBuilder: (context, index) {
                    // Find the corresponding order for the current orderItem
                    final correspondingOrder = order.orders?.firstWhere(
                      (o) => o.id == ongoingOrderItems[index].orderId,
                    );

                    if (correspondingOrder == null) {
                      return const SizedBox.shrink();
                    }

                    return OrderTile(
                      ongoingOrderItems[index],
                      correspondingOrder.tastydriveusers?.name,
                      correspondingOrder.tastydriveusers?.address,
                      () {
                        checkoutController.updateCheckOutOrder(
                          id: ongoingOrderItems[index].id ?? 0,
                          itemId: ongoingOrderItems[index].orderId ?? 0,
                          status: "Completed",
                        );
                      },
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class AllWidget extends StatelessWidget {
  const AllWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.06,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade400,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        "All",
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      )),
    );
  }
}
