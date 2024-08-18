import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    final AuthController authController = Get.put(AuthController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            "Orders",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final checkout = controller.checkout.value;

              final name =
                  authController.loginresponse.value?.users?.restaurantName;
              if (checkout == null ||
                  checkout.orders == null ||
                  checkout.orders!.isEmpty) {
                return const Center(
                  child: Text('No Orders found'),
                );
              }

              List<OrderItems> allOrderItems = checkout.orders!
                  .expand((order) => order.orderItems ?? <OrderItems>[])
                  .where((item) => item.restaurantName == name)
                  .toList();

              if (allOrderItems.isEmpty) {
                return const Center(
                  child: Text('No Order Items found'),
                );
              }

// Filter the list to include only items that belong to the logged-in user
              final filteredOrderItems = allOrderItems
                  .where((orderItem) => orderItem.restaurantName == name)
                  .toList();

              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.1,
                ),
                itemCount: filteredOrderItems.length,
                itemBuilder: (context, index) {
                  final orderItem = filteredOrderItems[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/restaurants/tiger_suger.jpg"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            orderItem.name ?? "",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "\$${orderItem.price}",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: orderItem.orderStatus == "OnGoing"
                              ? Text(
                                  "Already Assigned Delivery",
                                  style: GoogleFonts.poppins(color: Colors.red),
                                )
                              : orderItem.orderStatus == "Completed"
                                  ? Text(
                                      "Order Completed",
                                      style: GoogleFonts.poppins(
                                          color: Colors.green),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MaterialButton(
                                          height: 45,
                                          minWidth: 100,
                                          color: Colors.cyan,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          onPressed: () {
                                            if (orderItem.id != null) {
                                              controller.updateCheckOutOrder(
                                                id: orderItem.id ?? 0,
                                                itemId: orderItem.orderId ?? 0,
                                                status: "OnGoing",
                                              );
                                            }
                                          },
                                          child: Text(
                                            "Assign Deli",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                        ),
                                        MaterialButton(
                                          height: 45,
                                          minWidth: 100,
                                          color: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          onPressed: () {
                                            Get.dialog(
                                              AlertDialog(
                                                title: Text(
                                                  "Are you sure to Delete?",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 16),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: const Text("Cancel"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      controller.deleteOrder(
                                                          orderItem.id ?? 0);
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "Yes",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Delete",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        )
      ],
    );
  }
}
