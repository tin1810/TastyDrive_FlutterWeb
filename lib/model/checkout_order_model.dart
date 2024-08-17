class CheckoutOrderModel {
  String? status;
  List<Orders>? orders;

  CheckoutOrderModel({this.status, this.orders});

  CheckoutOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? restaurantId;
  int? userId;
  String? totalAmount;
  String? updatedAt;
  String? createdAt;
  int? id;
  List<OrderItems>? orderItems;

  Orders(
      {this.restaurantId,
      this.userId,
      this.totalAmount,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.orderItems});

  Orders.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    userId = json['user_id'];
    totalAmount = json['total_amount'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['user_id'] = this.userId;
    data['total_amount'] = this.totalAmount;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? id;
  int? orderId;
  String? name;
  String? description;
  String? restaurantName;
  double? price;
  String? status;
  int? isSpicy;
  String? category;
  String? createdAt;
  String? updatedAt;

  OrderItems(
      {this.id,
      this.orderId,
      this.name,
      this.description,
      this.restaurantName,
      this.status,
      this.price,
      this.isSpicy,
      this.category,
      this.createdAt,
      this.updatedAt});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    name = json['name'];
    description = json['description'];
    restaurantName = json['restaurant_name'];
    status = json["order_status"];
    price = json['price'];
    isSpicy = json['is_spicy'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['restaurant_name'] = this.restaurantName;
    data['order_status'] = this.status;
    data['price'] = this.price;
    data['is_spicy'] = this.isSpicy;
    data['category'] = this.category;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
