import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:logger/web.dart';
import 'package:tasty_drive_website/model/add_to_cart_list_model.dart';
import 'package:tasty_drive_website/model/checkout_order_model.dart';
import 'package:tasty_drive_website/model/checkout_update_response.model.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
import 'package:tasty_drive_website/model/dish_response_model.dart';
import 'package:tasty_drive_website/model/login_response_model.dart';
import 'package:tasty_drive_website/model/register_response_model.dart';
import 'package:tasty_drive_website/model/restaurant_model.dart';
import 'package:tasty_drive_website/model/restaurant_response_model.dart';
import 'package:tasty_drive_website/model/user_model.dart';

class ItemService {
  final String baseUrl = "http://localhost:8000/api";
  final _logger = Logger();
  Future<LoginResponseModel> login(
      {required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Login');
    }
  }

  Future<RegisterResponseModel> registerForRes({
    required String name,
    required String userName,
    required String email,
    required String password,
    required String address,
    required int isCustomer,
    required int isResAdmin,
    required int isAdmin,
    required String resName,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "name": name,
          "user_name": userName,
          "email": email,
          "password": password,
          "phone": "",
          "address": address,
          "is_customer": isCustomer,
          "is_admin": isAdmin,
          "is_restaurant_admin": isResAdmin,
          "restaurant_name": resName
        },
      ),
    );

    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Register');
    }
  }

  Future<LoginResponseModel> register({
    required String name,
    required String userName,
    required String email,
    required String password,
    required String phNo,
    required String address,
    required int isCustomer,
    required int isResAdmin,
    required int isAdmin,
    required String location,
    required dynamic time,
    required String distance,
    required dynamic description,
    required String resName,
  }) async {
    final response = await http.post(Uri.parse('$baseUrl/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "user_name": userName,
          "email": email,
          "password": password,
          "phone": phNo,
          "location": location,
          "address": address,
          "time": time,
          "distance": distance,
          "description": description,
          "is_customer": isCustomer,
          "is_admin": isAdmin,
          "is_restaurant_admin": isResAdmin,
          "restaurant_name": resName,
        }));
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Register');
    }
  }

  Future<UserModel> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/getusers'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return UserModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load items');
    }
  }

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

  Future<CheckoutModel?> getCheckoutOrder() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/getOrders'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        print("API Response: $jsonResponse"); // Log the JSON response
        return CheckoutModel.fromJson(jsonResponse);
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

  Future<CheckoutUpdateResponseModel> updateCheckoutOrder({
    required int id,
    required int itemId,
    required String status,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateOrderStatus/$id/$itemId'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "order_status": status,
      }),
    );
    if (response.statusCode == 200) {
      return CheckoutUpdateResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<LoginResponseModel> updateUser({
    required int id,
    required String name,
    required String userName,
    required String email,
    required String password,
    required String phNo,
    required String address,
    required int isCustomer,
    required int isResAdmin,
    required int isAdmin,
    required String location,
    required dynamic time,
    required String distance,
    required dynamic description,
    required String resName,
  }) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateUser/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "user_name": userName,
        "email": email,
        "password": password,
        "phone": phNo,
        "location": location,
        "address": address,
        "time": time,
        "distance": distance,
        "description": description,
        "is_customer": isCustomer,
        "is_admin": isAdmin,
        "is_restaurant_admin": isResAdmin,
        "restaurant_name": resName,
      }),
    );

    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<RestaurantResponseModel> createItem(
      {required String name,
      required String location,
      required String description,
      required String time,
      required String distance,
      required String email,
      required String password}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/createRestaurants'),
      body: {
        "name": name,
        "location": location,
        "description": description,
        "time": time,
        "distance": distance,
        "email": email,
        "password": password
      },
    );
    if (response.statusCode == 200) {
      return RestaurantResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<RestaurantResponseModel> updateRestaraunt(
      {required int id,
      required String name,
      required String userName,
      required String email,
      required String password,
      required String phNo,
      required String address,
      required int isCustomer,
      required int isResAdmin,
      required int isAdmin,
      required String location,
      required dynamic time,
      required String distance,
      required dynamic description,
      required String resName}) async {
    final response = await http.put(
      Uri.parse('$baseUrl/updateUser/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "name": name,
          "user_name": userName,
          "email": email,
          "password": password,
          "phone": phNo,
          "location": location,
          "address": address,
          "time": time,
          "distance": distance,
          "description": description,
          "is_customer": isCustomer,
          "is_admin": isAdmin,
          "is_restaurant_admin": isResAdmin,
          "restaurant_name": resName,
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
        "user_id": resId,
        "name": name,
        "description": description,
        "price": price,
        "is_spicy": isSpicy,
        "category": category
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
        "user_id": resId,
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

  Future<DishResponseModel> createAddToCart(
      {required int userId,
      required String name,
      required String resName,
      required String description,
      required int price,
      required int isspicy,
      required String category}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/createAddToCart'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_id": userId,
        "restaurant_name": resName,
        "name": name,
        "description": name,
        "price": price,
        "is_spicy": isspicy, // Convert int to String
        "category": category, // Convert int to String
      }),
    );
    if (response.statusCode == 200) {
      return DishResponseModel.fromJson(json.decode(response.body));
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

  Future<void> deleteOrder(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/deleteOrder/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/deleteUser/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<void> deleteRestaurant(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/deleteUser/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<CheckoutModel> checkoutOrder({
    // required int resId,
    required int userId,
    required double totalAmount,
    required List<Map<String, dynamic>> orderList,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/checkoutOrder'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        // "restaurant_id": resId,
        "user_id": userId,
        "total_amount": totalAmount,
        "order_list": orderList
      }),
    );
    if (response.statusCode == 200) {
      return CheckoutModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }
}
