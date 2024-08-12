import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/home_controller.dart';
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
    final HomeController homeController = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleWidget(),
          DeliProcessCardWidget(
              homeController: homeController, height: height, width: width),
          AllWidget(width: width),
          const SizedBox(
            height: 40,
          ),
          OrderListHeader(),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homeController.orders.length,
            itemBuilder: (context, index) {
              return OrderTile(order: homeController.orders[index]);
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
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        "All",
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      )),
    );
  }
}
