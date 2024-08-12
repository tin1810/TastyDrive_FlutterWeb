class DishModel {
  String? status;
  List<Dishes>? dishes;

  DishModel({this.status, this.dishes});

  DishModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(new Dishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dishes != null) {
      data['dishes'] = this.dishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dishes {
  int? id;
  int? restaurantId;
  String? name;
  String? description;
  double? price;
  int? isSpicy;
  String? category;
  String? createdAt;
  String? updatedAt;

  Dishes(
      {this.id,
      this.restaurantId,
      this.name,
      this.description,
      this.price,
      this.isSpicy,
      this.category,
      this.createdAt,
      this.updatedAt});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
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
