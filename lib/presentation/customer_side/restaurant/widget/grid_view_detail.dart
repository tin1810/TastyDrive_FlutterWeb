import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tasty_drive_website/controller/checkout_controller.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/controller/dish_controller.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/add_to_cart_dialog.dart';
import 'package:tasty_drive_website/presentation/customer_side/restaurant/widget/detail_card.dart';
import 'package:tasty_drive_website/responsive.dart';

class GridViewDetail extends StatelessWidget {
  final int id;
  const GridViewDetail({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    final DishController dishController = Get.put(DishController());

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        final dish = dishController.dish.value;
        if (dish == null) {
          return Center(child: Text('No Dish found'));
        }
        final filteredDishes =
            dish.dishes?.where((d) => d.restaurantId == id).toList() ?? [];

        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            int crossAxisCount;
            if (constraints.maxWidth < 600) {
              crossAxisCount = 1;
            } else if (constraints.maxWidth < 1200) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 2;
            }
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context)
                      ? 16
                      : Responsive.isTablet(context)
                          ? 30
                          : 50,
                  vertical: Responsive.isMobile(context) ? 10 : 20),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: Responsive.isMobile(context)
                    ? 7
                    : Responsive.isDesktop(context)
                        ? 30
                        : 20,
                mainAxisSpacing: Responsive.isMobile(context)
                    ? 7
                    : Responsive.isDesktop(context)
                        ? 30
                        : 20,
                childAspectRatio: Responsive.isMobile(context)
                    ? 1.6
                    : Responsive.isTablet(context)
                        ? 1.9
                        : 3.5,
              ),
              itemCount: filteredDishes.length,
              itemBuilder: (context, index) {
                final Dishes clickedDish = filteredDishes[index];
                return DetailItemCard(
                  icon: Icons.abc,
                  itemName:
                      dishController.dish.value?.dishes?[index].name ?? "",
                  price: dishController.dish.value?.dishes?[index].price ?? 0.0,
                  ingredint:
                      dishController.dish.value?.dishes?[index].description ??
                          "",
                  onClick: () {
                    if (clickedDish != null) {
                      print('Clicked dish: ${clickedDish.name}');
                      addToCartDialog(onClicked: () {
                        controller.creatAddToCart(
                          name:
                              dishController.dish.value?.dishes?[index].name ??
                                  "",
                          description: dishController
                                  .dish.value?.dishes?[index].description ??
                              "",
                          resName: "Burger King",
                          resId: dishController
                                  .dish.value?.dishes?[index].restaurantId
                                  .toString() ??
                              "",
                          userId: 1,
                          category: dishController
                                  .dish.value?.dishes?[index].category ??
                              "",
                          price: dishController
                                  .dish.value?.dishes?[index].price! ??
                              0,
                          isSpicy: dishController
                                  .dish.value?.dishes?[index].isSpicy ??
                              0,
                        );
                        controller.fetchAddToCart();
                        Get.back();
                      });
                    }
                  },
                );
              },
            );
          },
        );
      }
    });
  }
}
