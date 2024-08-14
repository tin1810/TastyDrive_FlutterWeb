import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasty_drive_website/model/add_to_cart_list_model.dart';
import 'package:tasty_drive_website/model/add_to_cart_response_model.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/model/dish_response_model.dart';
import 'package:tasty_drive_website/model/restaurant_model.dart';
import 'package:tasty_drive_website/model/restaurant_response_model.dart';

class ItemService {
  final String baseUrl = "http://localhost:8000/api";

  Future<RestaurantModel> getItems() async {
    final response = await http.get(Uri.parse('$baseUrl/getRestaurants'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return RestaurantModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<DishModel> getDishes() async {
    final response = await http.get(Uri.parse('$baseUrl/getdishes'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return DishModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<AddToCartListModel> getAddToCart() async {
    final response = await http.get(Uri.parse('$baseUrl/getAddToCart'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return AddToCartListModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<CheckoutOrderModel?> getCheckoutOrder() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/getOrders'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print("API Response: $jsonResponse"); // Log the JSON response
        return CheckoutOrderModel.fromJson(jsonResponse);
      } else {
        print(
            'Failed to load items: ${response.statusCode}'); // Log status code
        return null;
      }
    } catch (e) {
      print('Error occurred while fetching order: $e'); // Log the error
      return null;
    }
  }

  Future<RestaurantResponseModel> createItem(String name, String location,
      String description, String time, String distance) async {
    final response = await http.post(
      Uri.parse('$baseUrl/createRestaurants'),
      body: {
        "name": name,
        "location": location,
        "description": description,
        "time": time,
        "distance": distance
      },
    );
    if (response.statusCode == 200) {
      return RestaurantResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<RestaurantResponseModel> updateRestaraunt(int id, String name,
      String location, String description, String time, String distance) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateRestaurant/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "name": name,
          "location": location,
          "description": description,
          "time": time,
          "distance": distance
        },
      ),
    );
    if (response.statusCode == 200) {
      return RestaurantResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<DishResponseModel> createDish(
    int resId,
    String name,
    String price,
    String description,
    String category,
    int isSpicy,
  ) async {
    final response = await http.post(
      headers: {"Content-Type": "application/json"},
      Uri.parse('$baseUrl/createDish'),
      body: jsonEncode({
        "restaurant_id": resId,
        "name": name,
        "description": description,
        "price": price,
        "is_spicy": isSpicy,
        "category": category
        // "name": name,
        // "restaurantId": resId,
        // "price": price,
        // "description": description,
        // "category": category,
        // "isSpicy": isSpicy,
      }),
    );
    if (response.statusCode == 200) {
      return DishResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<DishResponseModel> updateDish(
    int id,
    int resId,
    String name,
    String price,
    String description,
    String category,
    int isSpicy,
  ) async {
    final response = await http.put(
      headers: {"Content-Type": "application/json"},
      Uri.parse('$baseUrl/updateDish/$id'),
      body: jsonEncode({
        "restaurant_id": resId,
        "name": name,
        "description": description,
        "price": price,
        "is_spicy": isSpicy,
        "category": category
        // "name": name,
        // "restaurantId": resId,
        // "price": price,
        // "description": description,
        // "category": category,
        // "isSpicy": isSpicy,
      }),
    );
    if (response.statusCode == 200) {
      return DishResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<DishModel> createAddToCart(
      {required String resId,
      required int userId,
      required String name,
      required String description,
      required String shop,
      required double price,
      required int isspicy,
      required String category}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/createAddToCart'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "restaurant_id": resId,
        "user_id": userId,
        "restaurant_name": shop,
        "name": name,
        "description": description,
        "price": price, // Convert int to String
        "is_spicy": isspicy, // Convert int to String
        "category": category
      }),
    );
    if (response.statusCode == 200) {
      return DishModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<void> deleteItem(int id) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/deleteAddToCart/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<void> deleteDish(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/deleteDish/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<void> deleteRestaurant(int id) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/deleteRestaurant/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<CheckoutOrderModel> checkoutOrder({
    required int resId,
    required int userId,
    required double totalAmount,
    required List<Map<String, dynamic>> orderList,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/checkoutOrder'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "restaurant_id": resId,
        "user_id": 1,
        "total_amount": totalAmount,
        "order_list": orderList
      }),
    );
    if (response.statusCode == 200) {
      return CheckoutOrderModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }
}
