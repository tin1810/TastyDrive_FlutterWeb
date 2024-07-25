import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tasty_drive_website/presentation/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/restaurant/restaurant_detail.dart';
import 'package:tasty_drive_website/presentation/restaurant/widget/all_restaurant_item.dart';
import 'package:tasty_drive_website/presentation/restaurant/widget/hover_icon.dart';
import 'package:tasty_drive_website/presentation/restaurant/widget/popular_text_widget.dart';
import 'package:tasty_drive_website/presentation/restaurant/widget/route_to_home_widget.dart';
import 'package:tasty_drive_website/presentation/restaurant/widget/search_text_field_widget.dart';
import 'package:tasty_drive_website/responsive.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar.dart';

class AllRestaurantScreen extends StatelessWidget {
  const AllRestaurantScreen({super.key});

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
            SearchTextFieldWidget(width: width),
            const RouteToHomeWidget(),
            const PopularTitleTextWidget(),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                int crossAxisCount;
                if (constraints.maxWidth < 600) {
                  crossAxisCount = 2;
                } else if (constraints.maxWidth < 1200) {
                  crossAxisCount = 4;
                } else {
                  crossAxisCount = 4;
                }
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.isMobile(context) ? 16 : 50,
                      vertical: Responsive.isMobile(context) ? 10 : 20),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: Responsive.isMobile(context) ? 7 : 10,
                    mainAxisSpacing: Responsive.isMobile(context) ? 7 : 10,
                    childAspectRatio: Responsive.isMobile(context)
                        ? 0.56
                        : Responsive.isTablet(context)
                            ? 0.45
                            : 1,
                  ),
                  itemCount: 19,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(() => RestaurantDetailScreen());
                        },
                        child: AllRestaurantItem(height: height));
                  },
                );
              },
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
