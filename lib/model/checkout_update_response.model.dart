class CheckoutUpdateResponseModel {
  String? status;
  Order? order;

  CheckoutUpdateResponseModel({this.status, this.order});

  CheckoutUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  String? name;
  String? description;
  String? restaurantName;
  String? orderStatus;
  int? price;
  int? isSpicy;
  String? category;
  String? createdAt;
  String? updatedAt;
  int? orderId;

  Order(
      {this.id,
      this.name,
      this.description,
      this.restaurantName,
      this.orderStatus,
      this.price,
      this.isSpicy,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.orderId});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    restaurantName = json['restaurant_name'];
    orderStatus = json['order_status'];
    price = json['price'];
    isSpicy = json['is_spicy'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['restaurant_name'] = this.restaurantName;
    data['order_status'] = this.orderStatus;
    data['price'] = this.price;
    data['is_spicy'] = this.isSpicy;
    data['category'] = this.category;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_id'] = this.orderId;
    return data;
  }
}
