import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/home_header.dart';
import 'package:restaurant_app/widgets/restaurant_item.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [Icon(Icons.menu), SizedBox(width: defaultPadding)]),
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: defaultPadding),
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  final List<Restaurant> restaurants =
                      parseRestaurants(snapshot.data);
                  return ListView.builder(
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      return _buildRestaurantItem(context, restaurants[index]);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return RestaurantItem(restaurant: restaurant);
  }
}
