class DishResponseModel {
  String? status;
  Dishes? dishes;

  DishResponseModel({this.status, this.dishes});

  DishResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dishes =
        json['dishes'] != null ? new Dishes.fromJson(json['dishes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dishes != null) {
      data['dishes'] = this.dishes!.toJson();
    }
    return data;
  }
}

class Dishes {
  int? userId;
  String? name;
  String? description;
  String? price;
  int? isSpicy;
  String? category;
  String? updatedAt;
  String? createdAt;
  int? id;

  Dishes(
      {this.userId,
      this.name,
      this.description,
      this.price,
      this.isSpicy,
      this.category,
      this.updatedAt,
      this.createdAt,
      this.id});

  Dishes.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
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
    data['user_id'] = this.userId;
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
