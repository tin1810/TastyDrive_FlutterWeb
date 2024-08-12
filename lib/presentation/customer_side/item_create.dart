import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/controller.dart';

class CreateRestaurantScreen extends StatelessWidget {
  final RestaurantController controller = Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Restaurant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Form(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: controller.locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextFormField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.nameController.text;

                          controller.locationController.text;

                          controller.descriptionController.text;

                          controller.createRestaurant();
                        },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator()
                      : Text('Create Restaurant'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
