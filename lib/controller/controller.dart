import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasty_drive_website/model/add_to_cart_list_model.dart';
import 'package:tasty_drive_website/model/add_to_cart_response_model.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/model/restaurant_model.dart';
import 'package:tasty_drive_website/model/restaurant_response_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/success_dialog.dart';

class RestaurantController extends GetxController {
  final ItemService _itemService = ItemService();
  var restaurant = Rx<RestaurantModel?>(null);
  var restaurants = Rx<RestaurantResponseModel?>(null);
  var dish = Rx<DishModel?>(null);
  var addToCart = Rx<AddToCartListModel?>(null);

  var isLoading = true.obs;

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchDishes();
    fetchAddToCart();
  }

  @override
  void onClose() {
    nameController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void fetchItems() async {
    try {
      isLoading.value = true;
      restaurant.value = await _itemService.getItems();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void fetchDishes() async {
    try {
      isLoading.value = true;
      dish.value = await _itemService.getDishes();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void fetchAddToCart() async {
    try {
      isLoading.value = true;
      addToCart.value = await _itemService.getAddToCart();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void createRestaurant() async {
    try {
      isLoading.value = true;
      RestaurantResponseModel response = await _itemService.createItem(
          nameController.text,
          locationController.text,
          descriptionController.text);

      if (response.status == 'success') {
        showSuccessDialog();
        // Get.snackbar('Success', 'Restaurant created successfully');
        fetchItems();
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

// {
//     "restaurant_id": 1,
//     "user_id": 1,
//     "restaurant_name": "Buger King",
//     "name": "Cheese Sandwich",
//     "description": "This is Sandwich",
//     "price": 8,
//     "is_spicy": 0,
//     "category": "Sandwich"
// }
  void creatAddToCart({
    required String name,
    required String description,
    required String resName,
    required String resId,
    required int userId,
    required String category,
    required double price,
    required int isSpicy,
  }) async {
    try {
      isLoading.value = true;
      DishModel response = await _itemService.createAddToCart(
          resId: resId,
          userId: userId,
          name: name,
          description: description,
          shop: resName,
          price: price,
          isspicy: isSpicy,
          category: category);

      if (response.status == 'success') {
        showSuccessDialog();
        // Get.snackbar('Success', 'Restaurant created successfully');
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void deleteFromCart(int id) async {
    try {
      await _itemService.deleteItem(id); // Use the deleteItem method

      // If the deletion was successful, remove the item from the local list
      addToCart.value?.addToCart?.removeWhere((item) => item.id == id);
      addToCart.refresh(); // Refresh the list to update the UI
      Get.snackbar('Success', 'Item removed from cart');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
