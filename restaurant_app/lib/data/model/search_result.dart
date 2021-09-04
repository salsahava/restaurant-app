import 'package:restaurant_app/data/model/restaurant.dart';

class SearchResult {
  SearchResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<Restaurant> restaurants;

  factory SearchResult.fromJson(Map<String, dynamic> searchResult) =>
      SearchResult(
        error: searchResult['error'],
        founded: searchResult['founded'],
        restaurants: List<Restaurant>.from(
            searchResult['restaurants'].map((x) => Restaurant.fromJson(x))),
      );
}
