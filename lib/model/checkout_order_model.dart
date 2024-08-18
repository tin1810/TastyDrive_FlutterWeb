class CheckoutModel {
  String? status;
  List<Orders>? orders;

  CheckoutModel({this.status, this.orders});

  CheckoutModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? totalAmount;
  String? createdAt;
  String? updatedAt;
  int? userId;
  List<OrderItems>? orderItems;
  Tastydriveusers? tastydriveusers;

  Orders(
      {this.id,
      this.totalAmount,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.orderItems,
      this.tastydriveusers});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalAmount = json['total_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    if (json['order_items'] != null) {
      orderItems = <OrderItems>[];
      json['order_items'].forEach((v) {
        OrderItems item = OrderItems.fromJson(v);
        item.userId = this.userId; // Assign userId to each orderItem
        orderItems!.add(item);
      });
    }
    tastydriveusers = json['tastydriveusers'] != null
        ? new Tastydriveusers.fromJson(json['tastydriveusers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_amount'] = this.totalAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems!.map((v) {
        v.userId = this.userId; // Ensure userId is included in toJson
        return v.toJson();
      }).toList();
    }
    if (this.tastydriveusers != null) {
      data['tastydriveusers'] = this.tastydriveusers!.toJson();
    }
    return data;
  }
}

class OrderItems {
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
  int? userId;

  OrderItems(
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
      this.orderId,
      this.userId});

  OrderItems.fromJson(Map<String, dynamic> json) {
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
    userId = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['restaurant_name'] = restaurantName;
    data['order_status'] = orderStatus;
    data['price'] = price;
    data['is_spicy'] = isSpicy;
    data['category'] = category;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order_id'] = orderId;
    data['user_id'] = userId;
    return data;
  }
}

class Tastydriveusers {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? password;
  String? phone;
  String? location;
  String? description;
  String? time;
  String? distance;
  String? address;
  int? isCustomer;
  int? isAdmin;
  int? isRestaurantAdmin;
  String? restaurantName;
  String? createdAt;
  String? updatedAt;

  Tastydriveusers(
      {this.id,
      this.name,
      this.userName,
      this.email,
      this.password,
      this.phone,
      this.location,
      this.description,
      this.time,
      this.distance,
      this.address,
      this.isCustomer,
      this.isAdmin,
      this.isRestaurantAdmin,
      this.restaurantName,
      this.createdAt,
      this.updatedAt});

  Tastydriveusers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    location = json['location'];
    description = json['description'];
    time = json['time'];
    distance = json['distance'];
    address = json['address'];
    isCustomer = json['is_customer'];
    isAdmin = json['is_admin'];
    isRestaurantAdmin = json['is_restaurant_admin'];
    restaurantName = json['restaurant_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['description'] = this.description;
    data['time'] = this.time;
    data['distance'] = this.distance;
    data['address'] = this.address;
    data['is_customer'] = this.isCustomer;
    data['is_admin'] = this.isAdmin;
    data['is_restaurant_admin'] = this.isRestaurantAdmin;
    data['restaurant_name'] = this.restaurantName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
