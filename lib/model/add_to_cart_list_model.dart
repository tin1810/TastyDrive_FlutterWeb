class AddToCartListModel {
  String? status;
  List<AddToCart>? addToCart;

  AddToCartListModel({this.status, this.addToCart});

  AddToCartListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['add_to_cart'] != null) {
      addToCart = <AddToCart>[];
      json['add_to_cart'].forEach((v) {
        addToCart!.add(new AddToCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.addToCart != null) {
      data['add_to_cart'] = this.addToCart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddToCart {
  int? id;
  int? restaurantId;
  int? userId;
  String? restaurantName;
  String? name;
  String? description;
  double? price;
  int? isSpicy;
  String? category;
  String? createdAt;
  String? updatedAt;

  AddToCart(
      {this.id,
      this.restaurantId,
      this.userId,
      this.restaurantName,
      this.name,
      this.description,
      this.price,
      this.isSpicy,
      this.category,
      this.createdAt,
      this.updatedAt});

  AddToCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    userId = json['user_id'];
    restaurantName = json['restaurant_name'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    isSpicy = json['is_spicy'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['user_id'] = this.userId;
    data['restaurant_name'] = this.restaurantName;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['is_spicy'] = this.isSpicy;
    data['category'] = this.category;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
