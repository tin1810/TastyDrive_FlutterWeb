import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/line_painter.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/detail_text_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/grid_view_detail.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/restaurant_card_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/route_to_other.dart';
import 'package:tasty_drive_website/responsive.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarRestaurant(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RouteToOtherWidget(),
            RestaurantCardWidget(width: width),
            CustomPaint(
              size: Size(width, 1), // Set the desired size
              painter: LinePainterGrey(),
            ),
            const DetailTextWidget(
              name: "Popular",
              hasIcon: true,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Responsive.isMobile(context)
                      ? 10
                      : Responsive.isTablet(context)
                          ? 30
                          : 50,
                  top: 10),
              child: Text(
                "Most Ordered These Days",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            const GridViewDetail(),
            const DetailTextWidget(
              name: "Juice",
              hasIcon: false,
            ),
            const GridViewDetail(),
          ],
        ),
      ),
    );
  }
}
