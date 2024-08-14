import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());

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
              if (checkout == null) {
                return const Center(child: Text('No Orders found'));
              }
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.3),
                itemCount: checkout.orders?.first.orderItems?.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.2))),
                    margin: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
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
                                "assets/restaurants/tiger_suger.jpg",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            checkout.orders?.first.orderItems?[index].name ??
                                "",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "\$${controller.checkout.value?.orders?.first.orderItems?[index].price ?? 0}",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
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
