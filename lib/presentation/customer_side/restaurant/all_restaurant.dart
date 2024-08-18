import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/model/user_model.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/restaurant_detail.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/all_restaurant_item.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/popular_text_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/route_to_home_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/search_text_field_widget.dart';
import 'package:tasty_drive_website/responsive.dart';
import 'package:tasty_drive_website/util/widget/appbar_res.dart';
import 'package:tasty_drive_website/util/widget/custom_appbar.dart';

class AllRestaurantScreen extends StatelessWidget {
  const AllRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.put(RestaurantController());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarRestaurant(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SearchTextFieldWidget(width: width),
            const RouteToHomeWidget(),
            const PopularTitleTextWidget(),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                final restaurant = controller.users.value;
                if (restaurant == null) {
                  return Center(child: Text('No restaurant found'));
                }
                final restaurants = controller.users.value?.users
                    ?.where((u) => u.isRestaurantAdmin == 1)
                    .toList();

                return LayoutBuilder(
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
                                : 1.3,
                      ),
                      itemCount: restaurants?.length,
                      itemBuilder: (context, index) {
                        // final Users? clickedRes =
                        //     controller.users.value?.users?[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => RestaurantDetailScreen(
                                  restaurants: restaurants?[index],
                                ));
                          },
                          child: AllRestaurantItem(
                            height: height,
                            restaurants: restaurants?[index],
                          ),
                        );
                      },
                    );
                  },
                );
              }
            }),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
