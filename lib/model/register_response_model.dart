class RegisterResponseModel {
  String? status;
  Users? users;

  RegisterResponseModel({this.status, this.users});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
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
  String? updatedAt;
  String? createdAt;
  int? id;

  Users(
      {this.name,
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
      this.updatedAt,
      this.createdAt,
      this.id});

  Users.fromJson(Map<String, dynamic> json) {
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
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
