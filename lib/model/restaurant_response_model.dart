class RestaurantResponseModel {
  String? status;
  Restaurants? restaurants;

  RestaurantResponseModel({this.status, this.restaurants});

  RestaurantResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    restaurants = json['restaurants'] != null
        ? new Restaurants.fromJson(json['restaurants'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.toJson();
    }
    return data;
  }
}

class Restaurants {
  String? name;
  String? location;
  String? description;
  String? updatedAt;
  String? createdAt;
  int? id;

  Restaurants(
      {this.name,
      this.location,
      this.description,
      this.updatedAt,
      this.createdAt,
      this.id});

  Restaurants.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
