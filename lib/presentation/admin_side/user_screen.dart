import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/controller/dish_controller.dart';

import 'package:tasty_drive_website/presentation/admin_side/widget/edit_dish_dialog.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/title_dishes_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final AuthController authController = Get.put(AuthController());
    final RestaurantController restaurantController =
        Get.find<RestaurantController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Manage Users",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () {
            if (restaurantController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              final user = restaurantController.users.value;
              if (user == null) {
                return Center(child: Text('No User found'));
              }

              // Filter users where is_customer == 1
              final customers = restaurantController.users.value?.users
                  ?.where((u) => u.isCustomer == 1)
                  .toList();

              if (customers == null || customers.isEmpty) {
                return Center(child: Text('No customers found'));
              }

              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.15),
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  final customer = customers[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.2))),
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
                            customer.name ?? "",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            customer.email ?? "",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: MaterialButton(
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
                                          restaurantController.deleteRestaurant(
                                              customer.id ?? 0);
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
                            child: Text("Delete"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        )
      ],
    );
  }
}
