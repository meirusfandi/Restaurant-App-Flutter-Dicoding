// To parse this JSON data, do
//
//     final restaurantsResult = restaurantsResultFromJson(jsonString);

import 'dart:convert';

RestaurantsResult restaurantsResultFromJson(String str) => RestaurantsResult.fromJson(json.decode(str));

String restaurantsResultToJson(RestaurantsResult data) => json.encode(data.toJson());

class RestaurantsResult {
  RestaurantsResult({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<Restaurants> restaurants;

  factory RestaurantsResult.fromJson(Map<String, dynamic> json) => RestaurantsResult(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<Restaurants>.from(json["restaurants"].map((x) => Restaurants.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class Restaurants {
  Restaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };
}
