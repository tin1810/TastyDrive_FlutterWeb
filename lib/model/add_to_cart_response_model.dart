class AddToCartResponseModel {
  String? status;
  AddToCart? addToCart;

  AddToCartResponseModel({this.status, this.addToCart});

  AddToCartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    addToCart = json['addToCart'] != null
        ? new AddToCart.fromJson(json['addToCart'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.addToCart != null) {
      data['addToCart'] = this.addToCart!.toJson();
    }
    return data;
  }
}

class AddToCart {
  int? restaurantId;
  int? userId;
  String? restaurantName;
  String? name;
  String? description;
  int? price;
  int? isSpicy;
  String? category;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddToCart(
      {this.restaurantId,
      this.userId,
      this.restaurantName,
      this.name,
      this.description,
      this.price,
      this.isSpicy,
      this.category,
      this.updatedAt,
      this.createdAt,
      this.id});

  AddToCart.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    userId = json['user_id'];
    restaurantName = json['restaurant_name'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    isSpicy = json['is_spicy'];
    category = json['category'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['user_id'] = this.userId;
    data['restaurant_name'] = this.restaurantName;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['is_spicy'] = this.isSpicy;
    data['category'] = this.category;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
