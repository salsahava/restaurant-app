import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> getRestaurantList() async {
    final response = await http.get(Uri.parse(_baseUrl + 'list'));

    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetailResult> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/$id'));

    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<RestaurantResult> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=$query'));

    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search result');
    }
  }
}
