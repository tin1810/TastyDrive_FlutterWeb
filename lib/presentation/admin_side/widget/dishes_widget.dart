import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/auth_controller.dart';
import 'package:tasty_drive_website/controller/dish_controller.dart';

import 'package:tasty_drive_website/presentation/admin_side/widget/edit_dish_dialog.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/title_dishes_widget.dart';

class DishesWidget extends StatelessWidget {
  const DishesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DishController dishController = Get.put(DishController());
    final AuthController authController = Get.put(AuthController());

    return Column(
      children: [
        TitleWIdgetForDishes(
          name: "Manage Dishes",
          buttonName: '+ Add Dishes',
          id: authController.loginresponse.value?.users?.id ?? 0,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () {
            if (dishController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final dish = dishController.dish.value;
              if (dish == null) {
                return const Center(child: Text('No restaurant found'));
              }
              final filteredDishes = dish.dishes
                      ?.where((d) =>
                          d.userId ==
                          authController.loginresponse.value?.users?.id)
                      .toList() ??
                  [];
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.1),
                itemCount: filteredDishes.length,
                itemBuilder: (context, index) {
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
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: filteredDishes[index].category == "Drink"
                                  ? const AssetImage(
                                      "assets/restaurants/drink.jpg")
                                  : filteredDishes[index].category ==
                                          "Appetizer"
                                      ? const AssetImage(
                                          "assets/restaurants/appetizer.jpg")
                                      : filteredDishes[index].category ==
                                              "Fried Chicken"
                                          ? const AssetImage(
                                              "assets/restaurants/chickenFried.jpg")
                                          : filteredDishes[index].category ==
                                                  "Chocolate"
                                              ? const AssetImage(
                                                  "assets/restaurants/chocolate.jpg")
                                              : filteredDishes[index]
                                                          .category ==
                                                      "Mala"
                                                  ? const AssetImage(
                                                      "assets/restaurants/mala.jpg")
                                                  : filteredDishes[index]
                                                              .category ==
                                                          "Hotpot"
                                                      ? const AssetImage(
                                                          "assets/restaurants/hotpot.jpg")
                                                      : filteredDishes[index]
                                                                  .category ==
                                                              "Coffee"
                                                          ? const AssetImage(
                                                              "assets/restaurants/coffee.jpg",
                                                            )
                                                          : filteredDishes[
                                                                          index]
                                                                      .category ==
                                                                  "Sandwich"
                                                              ? const AssetImage(
                                                                  "assets/restaurants/sandwich.jpg",
                                                                )
                                                              : const AssetImage(
                                                                  "assets/restaurants/tiger_suger.jpg",
                                                                ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            filteredDishes[index].name ?? "",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            filteredDishes[index].category ?? "",
                            style: GoogleFonts.poppins(
                                color: Colors.lightGreen,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Price : \$${filteredDishes[index].price ?? ""}",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
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
                                  final selectedDish = filteredDishes[index];
                                  if (selectedDish != null) {
                                    editDishDialog(selectedDish);
                                  }
                                },
                                child: Text(
                                  "Edit",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              MaterialButton(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {
                                  //  dishController
                                  //     .deleteDish(dish.dishes?[index].id ?? 0);
                                  Get.dialog(
                                    AlertDialog(
                                      title: Text(
                                        "Are you sure to Delete?",
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text("Cancel")),
                                        TextButton(
                                            onPressed: () {
                                              dishController.deleteDish(
                                                  filteredDishes[index].id ??
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
                                child: Text(
                                  "Delete",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 14),
                                ),
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
          },
        )
      ],
    );
  }
}
