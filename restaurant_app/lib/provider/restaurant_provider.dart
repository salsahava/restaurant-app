import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

enum ResultState { Loading, NoConnection, NoData, HasData, Error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurants();
  }

  RestaurantResult? _restaurantResult;
  String _message = '';
  ResultState? _state;

  String get message => _message;

  RestaurantResult? get restaurantResult => _restaurantResult;

  ResultState? get state => _state;

  Future<dynamic> _fetchAllRestaurants() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();

      var connectivity = await Connectivity().checkConnectivity();
      final restaurantList = await apiService.getRestaurantList();

      if (connectivity == ConnectivityResult.none) {
        _state = ResultState.NoConnection;
        notifyListeners();
        return _message = 'No internet connection';
      }

      if (restaurantList.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'No results to display';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = restaurantList;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message =
          'Something went wrong. Please refresh the page to try again.';
    }
  }
}
