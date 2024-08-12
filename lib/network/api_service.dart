import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasty_drive_website/model/add_to_cart_list_model.dart';
import 'package:tasty_drive_website/model/add_to_cart_response_model.dart';
import 'package:tasty_drive_website/model/dish_model.dart';
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

  Future<RestaurantResponseModel> createItem(
    String name,
    String location,
    String description,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/createRestaurant'),
      body: {
        "name": name,
        "location": location,
        "description": description,
      },
    );
    if (response.statusCode == 200) {
      return RestaurantResponseModel.fromJson(json.decode(response.body));
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
      body: {
        "restaurant_id": resId,
        "user_id": userId,
        "restaurant_name": shop,
        "name": name,
        "description": description,
        "price": price, // Convert int to String
        "is_spicy": isspicy, // Convert int to String
        "category": category
      },
    );
    if (response.statusCode == 200) {
      return DishModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  // Future<Item> updateItem(int id, Item item) async {
  //   final response = await http.put(
  //     Uri.parse('$baseUrl/items/$id'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(item.toJson()),
  //   );
  //   if (response.statusCode == 200) {
  //     return Item.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to update item');
  //   }
  // }

  Future<void> deleteItem(int id) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/deleteAddToCart/$id'));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete item');
    }
  }
}
