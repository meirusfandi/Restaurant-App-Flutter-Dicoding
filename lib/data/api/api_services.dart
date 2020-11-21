import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurants.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static final String _apiKey = "https://restaurant-api.dicoding.dev/";

  Future<RestaurantsResult> getListRestaurant() async {
    final response = await http.get(_apiKey+"list");
    print(_apiKey+"list");
    print("response body result : ${response.body}");

    if (response.statusCode == 200) {
      print("response success");
      return RestaurantsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load restaurants");
    }
  }

  Future<RestaurantResult> getDetailRest(String idRest) async {
    final response = await http.get(_apiKey+"detail/$idRest");

    print("response body result : ${response.body}");

    if (response.statusCode == 200) {
      print("response success");
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load detail restaurant");
    }
  }
}