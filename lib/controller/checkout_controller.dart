import 'package:get/get.dart';
import 'package:tasty_drive_website/controller/controller.dart';
import 'package:tasty_drive_website/model/add_to_cart_list_model.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';
import 'package:tasty_drive_website/model/checkout_update_response.model.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/model/dish_response_model.dart';
import 'package:tasty_drive_website/network/api_service.dart';
import 'package:logger/web.dart';
import 'package:tasty_drive_website/presentation/admin_side/widget/success_dialog.dart';
import 'package:tasty_drive_website/presentation/customer_side/home/home_page.dart';

class CheckoutController extends GetxController {
  final ItemService _itemService = ItemService();
  final RestaurantController restaurantController =
      Get.find<RestaurantController>();
  var checkout = Rx<CheckoutModel?>(null);
  var addToCart = Rx<AddToCartListModel?>(null);
  var checkoutResponse = Rx<CheckoutUpdateResponseModel?>(null);
  var isAssigned = false.obs;
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
      return 0;
    }

    final frequencyMap = <int, int>{};
    for (var id in restaurantIds) {
      frequencyMap[id] = (frequencyMap[id] ?? 0) + 1;
    }

    final sortedEntries = frequencyMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedEntries.isNotEmpty ? sortedEntries.first.key : 0;
  }

  void updateCheckOutOrder({
    required int id,
    required int itemId,
    required String status,
  }) async {
    try {
      isLoading.value = true;
      CheckoutUpdateResponseModel response =
          await _itemService.updateCheckoutOrder(
        id: id,
        itemId: itemId,
        status: status,
      );

      if (response.status == 'success') {
        _logger.i(response);

        fetchOrder();
        Get.snackbar('Success', 'Success Delivery Assign');
      } else {
        Get.snackbar('Error', 'Failed to create restaurant');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void checkoutOrder({
    // required int resId,
    required int userId,
    required double totalAmount,
    required List<Map<String, dynamic>> orderList,
  }) async {
    try {
      isLoading.value = true;
      CheckoutModel response = await _itemService.checkoutOrder(
        // resId: resId,
        userId: userId,
        totalAmount: totalAmount,
        orderList: orderList,
      );

      if (response.status == 'success') {
        _logger.i(response);
        deleteFromCartAll();
        Get.offAll(() => HomePage());
        showSuccessDialog("Successfully Ordered");
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
    required int userId,
    required String category,
    required int price,
    required int isSpicy,
  }) async {
    try {
      isLoading.value = true;
      DishResponseModel response = await _itemService.createAddToCart(
          userId: userId,
          name: name,
          resName: resName,
          description: description,
          price: price,
          isspicy: isSpicy,
          category: category);

      if (response.status == 'success') {
        showSuccessDialog("Successfully Add To Cart");
        fetchAddToCart();
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
      Get.snackbar('Success', 'Item removed from cart',
          duration: Duration(seconds: 2));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void deleteOrder(int id) async {
    try {
      await _itemService.deleteOrder(id); // Use the deleteItem method

      // If the deletion was successful, remove the item from the local list
      checkout.value?.orders?.first.orderItems
          ?.removeWhere((item) => item.id == id);
      checkout.refresh(); // Refresh the list to update the UI
      fetchOrder();
      Get.snackbar('Success', 'Deleted Order', duration: Duration(seconds: 2));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void deleteFromCartAll() async {
    try {
      isLoading.value = true;

      // Iterate over all items in the cart and delete them one by one
      for (var item in addToCart.value?.addToCart ?? []) {
        await _itemService.deleteItem(item.id);
      }

      // Clear the local list after all deletions
      addToCart.value?.addToCart?.clear();
      addToCart.refresh(); // Refresh the list to update the UI
      Get.snackbar('Success', 'All items removed from cart');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
