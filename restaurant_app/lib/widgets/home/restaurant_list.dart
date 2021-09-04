import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/notices.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/home/restaurant_item.dart';

class RestaurantList extends StatefulWidget {
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  Future<RestaurantResult>? _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().getRestaurantList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: defaultPadding),
        child: FutureBuilder(
          future: _restaurant,
          builder: (context, AsyncSnapshot<RestaurantResult> snapshot) {
            var state = snapshot.connectionState;

            if (state == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (state == ConnectionState.none) {
              return noInternetNotice(context, screenSize);
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurant = snapshot.data?.restaurants[index];
                    return RestaurantItem(restaurant: restaurant!);
                  },
                );
              } else if (snapshot.hasError) {
                return errorNotice(context, screenSize);
              } else {
                return Text('');
              }
            }
          },
        ),
      ),
    );
  }
}
