import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/model/restaurant_model.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/custom_textfield.dart';

import '../../../controller/controller.dart';

void editRestaurantDialog(Restaurants restaurants) {
  final RestaurantController restaurantController =
      Get.put(RestaurantController());

  restaurantController.nameController.text = restaurants.name ?? "";
  restaurantController.descriptionController.text =
      restaurants.description ?? "";
  restaurantController.locationController.text = restaurants.location ?? "";

  restaurantController.distanceController.text = restaurants.distance ?? "";
  restaurantController.timeController.text = restaurants.time ?? "";

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
              "Add New Restaurant Form",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Restaurant Name",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: restaurantController.nameController,
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Restaurant Description",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: restaurantController.descriptionController,
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Address",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: restaurantController.locationController,
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Time",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: restaurantController.timeController,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "Distance",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: restaurantController.distanceController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  restaurantController.updateRestaurant(
                      id: restaurants.id ?? 0);
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
              height: 30,
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}