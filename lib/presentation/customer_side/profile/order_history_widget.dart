import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/order_list_header_widget.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/order_tile_widget.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/title_widget.dart';

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController =
        Get.find<CheckoutController>();
    final AuthController authController = Get.find<AuthController>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TitleUserWidget(),
        ),
        OrderListHeader(),
        Obx(
          () {
            if (checkoutController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final order = checkoutController.checkout.value;
              if (order == null) {
                return const Center(child: Text('No restaurant found'));
              }

              final id = authController.loginresponse.value?.users?.id;
              List<OrderItems> allOrderItems = order.orders!
                  .expand((order) => order.orderItems ?? <OrderItems>[])
                  .where((item) => item.userId == id)
                  .toList();

              // final ongoingOrderItems = allOrderItems
              //     .where((item) =>
              //         item.orderStatus == "OnGoing" ||
              //         item.orderStatus == "Completed")
              //     .toList();

              if (allOrderItems.isEmpty) {
                return const Center(
                    child: Text('No OnGoing or Completed orders found'));
              }

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allOrderItems.length,
                itemBuilder: (context, index) {
                  // Find the corresponding order for the current orderItem
                  final correspondingOrder = order.orders?.firstWhere(
                    (o) => o.id == allOrderItems[index].orderId,
                  );

                  if (correspondingOrder == null) {
                    return const SizedBox.shrink();
                  }

                  return OrderTileUser(
                    allOrderItems[index],
                    correspondingOrder.tastydriveusers?.name,
                    correspondingOrder.tastydriveusers?.address,
                    allOrderItems[index].category == "Coffee"
                        ? 'assets/restaurants/coffee.jpg'
                        : allOrderItems[index].category == "Drink"
                            ? 'assets/restaurants/coffee.jpg'
                            : allOrderItems[index].category == "Chocolate"
                                ? 'assets/restaurants/chocolate.jpg'
                                : allOrderItems[index].category == "Hotpot"
                                    ? 'assets/restaurants/hotpot.jpg'
                                    : allOrderItems[index].category == "Mala"
                                        ? 'assets/restaurants/mala.jpg'
                                        : allOrderItems[index].category ==
                                                "Sandwich"
                                            ? 'assets/restaurants/sandwich.jpg'
                                            : allOrderItems[index].category ==
                                                    "Fried Chicken"
                                                ? 'assets/restaurants/chickenFried.jpg'
                                                : allOrderItems[index]
                                                            .category ==
                                                        "Appetizer"
                                                    ? 'assets/restaurants/appetizer.jpg'
                                                    : 'assets/restaurants/tiger_suger.jpg',
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
