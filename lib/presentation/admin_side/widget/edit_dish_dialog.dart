import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/dish_controller.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/custom_textfield.dart';

void editDishDialog(Dishes dish) {
  final DishController dishController = Get.put(DishController());
  dishController.nameController.text = dish.name ?? "";
  dishController.descriptionController.text = dish.description ?? "";
  dishController.priceController.text = dish.price.toString();
  dishController.categoryController.text = dish.category ?? "";

  Get.dialog(
    AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Container(
        width: 500, // Set your desired width here
        margin: EdgeInsets.zero,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ),
            Text(
              "Add New Dishes Form",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Dish Name",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: dishController.nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Dish Description",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: dishController.descriptionController,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Price",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: dishController.priceController,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: dishController.categoryController,
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Is Spicy?",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      value: dishController.isSpicy.value,
                      onChanged: (bool? value) {
                        dishController.toggleIsSpicy(value ?? false);
                      },
                    ),
                    Text(
                      "Yes",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Checkbox(
                      activeColor: Colors.green,
                      value: !dishController.isSpicy.value,
                      onChanged: (bool? value) {
                        dishController.toggleIsSpicy(!(value ?? true));
                      },
                    ),
                    Text(
                      "No",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  dishController.updateDish(
                      resId: dish.restaurantId ?? 0, id: dish.id ?? 0);
                  Get.back();
                },
                color: Colors.green,
                child: Text(
                  "Confirm",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
