import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/checkout/widget/cart_item.dart';
import 'package:tasty_drive_website/presentation/checkout/widget/order_summary.dart';
import 'package:tasty_drive_website/presentation/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/home/widget/line_painter.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const CartItem(
                    imageUrl: 'assets/restaurants/tiger_suger.jpg',
                    title: 'Tiger Suger ',
                    description: 'It is so sweet with grilled mouse',
                    size: 'XL',
                    color: 'Marron',
                    price: 85,
                    originalPrice: 92,
                    quantity: 1,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return CustomPaint(
                    size: const Size(200, 10), // Set the desired size
                    painter: LinePainterGrey(),
                  );
                },
                itemCount: 3,
              ),
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
