import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/edit_restaurant_dialog.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/title_dishes_widget.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.put(RestaurantController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TitleWIdgetForDishes(
          name: 'Manage Restaurants',
          buttonName: '+ Add Restaurants',
          id: 8,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final restaurant = controller.restaurant.value;
            if (restaurant == null) {
              return const Center(child: Text('No restaurant found'));
            }
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.2),
              itemCount: controller.restaurant.value?.restaurants?.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(0.2))),
                  margin: const EdgeInsets.only(left: 25, right: 25),
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
                          controller
                                  .restaurant.value?.restaurants?[index].name ??
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
                          controller.restaurant.value?.restaurants?[index]
                                  .location ??
                              "",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              color: Colors.blue.withOpacity(0.8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                final selectedRes =
                                    restaurant.restaurants?[index];
                                if (selectedRes != null) {
                                  editRestaurantDialog(selectedRes);
                                }
                              },
                              child: const Text("Edit"),
                            ),
                            MaterialButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text(
                                      "Are you sure to Delete?",
                                      style: GoogleFonts.poppins(fontSize: 16),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("Cancel")),
                                      TextButton(
                                          onPressed: () {
                                            controller.deleteRestaurant(
                                                restaurant.restaurants?[index]
                                                        .id ??
                                                    0);
                                            Get.back();
                                          },
                                          child: Text(
                                            "Yes",
                                            style: GoogleFonts.poppins(
                                                color: Colors.red),
                                          ))
                                    ],
                                  ),
                                );
                              },
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        })
      ],
    );
  }
}
