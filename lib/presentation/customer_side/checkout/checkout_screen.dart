import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/widget/cart_item.dart';
import 'package:tasty_drive_website/presentation/customer_side/checkout/widget/order_summary.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/line_painter.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/side_menu.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.put(RestaurantController());

    return Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
          backgroundColor: Colors.cyan.withOpacity(0.2),
          title: Text("Add To Cart",
              style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.green)),
        ),
        // appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final addToCart = controller.addToCart.value;
                  if (addToCart == null) {
                    return Center(child: Text('No AddToCart found'));
                  }
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CartItem(
                        imageUrl: 'assets/restaurants/tiger_suger.jpg',
                        title: addToCart.addToCart?[index].name ?? "",
                        description:
                            addToCart.addToCart?[index].description ?? "",
                        price: addToCart.addToCart?[index].price ?? 0.0,
                        originalPrice: addToCart.addToCart?[index].price ?? 0.0,
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
                  );
                }
              }),
              CustomPaint(
                size: const Size(10000, 10), // Set the desired size
                painter: LinePainterGrey(),
              ),
              const SizedBox(height: 20),
              const OrderSummary(
                subtotal: 239,
                discount: 35.52,
                tax: 0,
                shipping: 'Free',
                total: 606.48,
              ),
              const SizedBox(height: 20),
              FooterSection(),
            ],
          ),
        ));
  }
}
