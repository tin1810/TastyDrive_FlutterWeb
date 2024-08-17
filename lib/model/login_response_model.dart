class LoginResponseModel {
  String? status;
  TastyDriveUsers? tastyDriveUsers;

  LoginResponseModel({this.status, this.tastyDriveUsers});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    tastyDriveUsers = json['tasty_drive_users'] != null
        ? new TastyDriveUsers.fromJson(json['tasty_drive_users'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.tastyDriveUsers != null) {
      data['tasty_drive_users'] = this.tastyDriveUsers!.toJson();
    }
    return data;
  }
}

class TastyDriveUsers {
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

  TastyDriveUsers(
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

  TastyDriveUsers.fromJson(Map<String, dynamic> json) {
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
