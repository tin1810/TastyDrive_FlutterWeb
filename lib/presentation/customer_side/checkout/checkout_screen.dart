import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/widget/cart_item.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/widget/order_summary.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/line_painter.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/side_menu.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.find<CheckoutController>();
    return Scaffold(
      // drawer: SideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.cyan.withOpacity(0.2),
        title: Text(
          "Checkout",
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final addToCart = controller.addToCart.value;
                if (addToCart == null) {
                  return const Center(child: Text('No AddToCart found'));
                }

                final double subtotal = double.parse((addToCart.addToCart?.fold(
                            0.0, (sum, item) => sum + (item.price ?? 0.0)) ??
                        0.0)
                    .toStringAsFixed(2));

                return Column(
                  children: [
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartItem(
                          imageUrl: addToCart.addToCart?[index].category ==
                                  "Coffee"
                              ? 'assets/restaurants/coffee.jpg'
                              : addToCart.addToCart?[index].category == "Drink"
                                  ? 'assets/restaurants/coffee.jpg'
                                  : addToCart.addToCart?[index].category ==
                                          "Chocolate"
                                      ? 'assets/restaurants/chocolate.jpg'
                                      : addToCart.addToCart?[index].category ==
                                              "Hotpot"
                                          ? 'assets/restaurants/hotpot.jpg'
                                          : addToCart.addToCart?[index]
                                                      .category ==
                                                  "Mala"
                                              ? 'assets/restaurants/mala.jpg'
                                              : addToCart.addToCart?[index]
                                                          .category ==
                                                      "Sandwich"
                                                  ? 'assets/restaurants/sandwich.jpg'
                                                  : addToCart.addToCart?[index]
                                                              .category ==
                                                          "Fried Chicken"
                                                      ? 'assets/restaurants/chickenFried.jpg'
                                                      : addToCart
                                                                  .addToCart?[
                                                                      index]
                                                                  .category ==
                                                              "Appetizer"
                                                          ? 'assets/restaurants/appetizer.jpg'
                                                          : 'assets/restaurants/tiger_suger.jpg',
                          title: addToCart.addToCart?[index].name ?? "",
                          description:
                              addToCart.addToCart?[index].description ?? "",
                          price: addToCart.addToCart?[index].price ?? 0.0,
                          originalPrice:
                              addToCart.addToCart?[index].price ?? 0.0,
                          quantity: 1,
                          onDelete: () {
                            controller.deleteFromCart(
                                addToCart.addToCart?[index].id ?? 0);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return CustomPaint(
                          size: const Size(200, 10), // Set the desired size
                          painter: LinePainterGrey(),
                        );
                      },
                      itemCount: addToCart.addToCart?.length ?? 0,
                    ),
                    CustomPaint(
                      size: const Size(10000, 10), // Set the desired size
                      painter: LinePainterGrey(),
                    ),
                    const SizedBox(height: 20),
                    OrderSummary(
                      subtotal: subtotal,
                      discount: 0,
                      tax: 0,
                      shipping: 'Free',
                      total: subtotal,
                      onCheckout: () {
                        List<Map<String, dynamic>> orderList =
                            addToCart.addToCart?.map((item) {
                                  return {
                                    "name": item.name ?? "",
                                    "description": item.description ?? "",
                                    "category": item.category ?? "",
                                    "price": item.price ?? 0.0,
                                    "is_spicy": item.isSpicy ?? 0,
                                    "order_status": "Pending",
                                    "restaurant_name":
                                        item.restaurantName ?? "",
                                  };
                                }).toList() ??
                                [];

                        var box = Hive.box('userBox');
                        var userId = box.get('userId');
                        controller.checkoutOrder(
                          userId: userId,
                          totalAmount: subtotal,
                          orderList: orderList,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
            }),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
