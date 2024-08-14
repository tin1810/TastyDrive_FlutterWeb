import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/model/add_to_cart_list_model.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:logger/web.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/success_dialog.dart';

class CheckoutController extends GetxController {
  final ItemService _itemService = ItemService();
  final RestaurantController restaurantController =
      Get.find<RestaurantController>();
  var checkout = Rx<CheckoutOrderModel?>(null);
  var addToCart = Rx<AddToCartListModel?>(null);
  @override
  void onInit() {
    super.onInit();
    fetchAddToCart();
    fetchOrder();
  }

  final _logger = Logger();
  var isLoading = true.obs;
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

  void fetchOrder() async {
    try {
      isLoading.value = true;
      print("Starting to fetch order...");

      final fetchedOrder = await _itemService.getCheckoutOrder();

      if (fetchedOrder != null) {
        checkout.value = fetchedOrder;
        _logger.i("Checkout Order List ==> ${checkout.value}");
        print("Fetched Order: ${checkout.value}");
      } else {
        print("Failed to fetch order or no data returned.");
      }
    } catch (e) {
      print("Exception while fetching order: $e");
    } finally {
      isLoading.value = false;
      print("Fetching process completed.");
    }
  }

  int selectRestaurantId(List<int> restaurantIds) {
    if (restaurantIds.isEmpty) {
      return 0; // Default or handle no restaurant case
    }

    // Count occurrences of each restaurant ID
    final frequencyMap = <int, int>{};
    for (var id in restaurantIds) {
      frequencyMap[id] = (frequencyMap[id] ?? 0) + 1;
    }

    // Find the restaurant ID with the highest frequency
    final sortedEntries = frequencyMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries.isNotEmpty ? sortedEntries.first.key : 0;
  }

  void checkoutOrder({
    required int resId,
    required int userId,
    required double totalAmount,
    required int id,
    required List<Map<String, dynamic>> orderList,
  }) async {
    try {
      isLoading.value = true;
      CheckoutOrderModel response = await _itemService.checkoutOrder(
        resId: resId,
        userId: userId,
        totalAmount: totalAmount,
        orderList: orderList,
      );

      if (response.status == 'success') {
        _logger.i(response);
        showSuccessDialog();
        Get.back();
        Get.back();
        deleteFromCartAll(id);
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

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

  void deleteFromCartAll(int id) async {
    try {
      await _itemService.deleteItem(id); // Use the deleteItem method

      // If the deletion was successful, remove the item from the local list
      addToCart.value?.addToCart?.removeWhere((item) => item.id == id);
      addToCart.refresh(); // Refresh the list to update the UI
      // Get.snackbar('Success', 'Item removed from cart');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
