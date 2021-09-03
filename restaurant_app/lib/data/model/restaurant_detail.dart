import 'package:restaurant_app/data/model/category.dart';
import 'package:restaurant_app/data/model/customer_review.dart';

import 'menu.dart';

class RestaurantDetailResult {
  RestaurantDetailResult({
    required this.error,
    required this.message,
    required this.restaurantDetail,
  });

  bool error;
  String message;
  RestaurantDetail restaurantDetail;

  factory RestaurantDetailResult.fromJson(
          Map<String, dynamic> restaurantDetailResult) =>
      RestaurantDetailResult(
          error: restaurantDetailResult['error'],
          message: restaurantDetailResult['message'],
          restaurantDetail:
              RestaurantDetail.fromJson(restaurantDetailResult['restaurant']));
}

class RestaurantDetail {
  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<Category> categories;
  Menu menus;
  double rating;
  List<CustomerReview> customerReviews;

  factory RestaurantDetail.fromJson(Map<String, dynamic> restaurantDetail) =>
      RestaurantDetail(
        id: restaurantDetail['id'],
        name: restaurantDetail['name'],
        description: restaurantDetail['description'],
        city: restaurantDetail['city'],
        address: restaurantDetail['address'],
        pictureId: restaurantDetail['pictureId'],
        categories: List<Category>.from(
            restaurantDetail['categories'].map((x) => Category.fromJson(x))),
        menus: Menu.fromJson(restaurantDetail['menus']),
        rating: restaurantDetail['rating'],
        customerReviews: List<CustomerReview>.from(
            restaurantDetail['customerReviews']
                .map((x) => CustomerReview.fromJson(x))),
      );
}
