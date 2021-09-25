import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/notices.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widgets/home/restaurant_item.dart';

class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.NoConnection) {
            return noInternetNotice(context, state.message);
          } else if (state.state == ResultState.Loading) {
            return Center(
                child: CircularProgressIndicator(color: darkBlueGrey));
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.restaurantResult!.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = state.restaurantResult!.restaurants[index];
                return RestaurantItem(restaurant: restaurant);
              },
            );
          } else if (state.state == ResultState.NoData) {
            return noResultsNotice(context, state.message);
          } else if (state.state == ResultState.Error) {
            return errorNotice(context, state.message);
          } else {
            return Center(child: Text(''));
          }
        },
      ),
    );
  }
}
