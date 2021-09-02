import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/home/restaurant_item.dart';

class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: defaultPadding),
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            var _returnWidget;

            if (snapshot.connectionState == ConnectionState.waiting) {
              _returnWidget = SizedBox(
                  height: screenSize.height / 1.3,
                  child: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              _returnWidget = SnackBar(
                content: Text(
                    'Something went wrong. Please refresh the page to try again.'),
              );
            } else if (snapshot.hasData) {
              final List<Restaurant> restaurants =
                  parseRestaurants(snapshot.data);
              _returnWidget = ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return _buildRestaurantItem(context, restaurants[index]);
                },
              );
            }
            return _returnWidget;
          },
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return RestaurantItem(restaurant: restaurant);
  }
}
