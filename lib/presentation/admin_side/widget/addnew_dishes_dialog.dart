import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/controller/dish_controller.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/custom_textfield.dart';

void showAddDishDialog(int id) {
  final DishController dishController = Get.put(DishController());

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
            const SizedBox(
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () async {
            //         // imageUploadController.pickImage();
            //         final input = html.FileUploadInputElement();
            //         input.accept = 'image/*';
            //         input.onChange.listen((e) async {
            //           final files = input.files;
            //           if (files!.isEmpty) {
            //             Get.snackbar("No Image Selected", "");
            //             return;
            //           }
            //           final file = files[0];
            //           final reader = html.FileReader();
            //           reader.readAsArrayBuffer(file);
            //           reader.onLoadEnd.listen((_) async {
            //             final fileBytes = reader.result as Uint8List;
            //             dishController.onPickUpImage(fileBytes, file.name);
            //           });
            //         });
            //         input.click();
            //       },
            //       child: const Text('Pick Image'),
            //     ),
            //     // Obx(() {
            //     //   return imageUploadController.selectedImageBase64.value != null
            //     //       ? Image.network(
            //     //           'data:image/png;base64,${imageUploadController.selectedImageBase64.value!}',
            //     //           height: 100,
            //     //           width: 100,
            //     //           fit: BoxFit.cover,
            //     //         )
            //     //       : const Text('No image selected');
            //     // }),
            //   ],
            // ),
            // // Display selected image

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  dishController.createDishWithImage(id);
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
