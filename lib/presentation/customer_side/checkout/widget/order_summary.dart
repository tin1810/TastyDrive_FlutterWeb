import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/responsive.dart';

class OrderSummary extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double tax;
  final String shipping;
  final double total;
  final Function onCheckout;
  const OrderSummary({
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.shipping,
    required this.total,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: Responsive.isMobile(context) ? width : width * 0.4,
      margin: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 20 : 60),
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          color: Colors.cyan.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sub Total'),
              Text('\$$subtotal', style: GoogleFonts.poppins()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount', style: GoogleFonts.poppins()),
              Text('-\$$discount', style: GoogleFonts.poppins()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax', style: GoogleFonts.poppins()),
              Text('\$$tax', style: GoogleFonts.poppins()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Shipping'),
              Text(shipping),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text('\$$total',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  onCheckout();
                },
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
