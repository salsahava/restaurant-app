import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/notices.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/utils/result_state.dart';
import 'package:restaurant_app/widgets/home/restaurant_item.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritesHeader = Padding(
      padding: const EdgeInsets.only(
        top: 48.0,
        right: defaultPadding,
        bottom: defaultPadding / 2,
        left: defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favorites',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'A list of your favorite restaurants',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontWeight: FontWeight.bold, color: darkBlueGrey),
          ),
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            favoritesHeader,
            Expanded(
              child: Consumer<DatabaseProvider>(
                builder: (context, provider, child) {
                  if (provider.state == ResultState.HasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.favorites.length,
                      itemBuilder: (context, index) {
                        var restaurant = provider.favorites[index];
                        return RestaurantItem(restaurant: restaurant);
                      },
                    );
                  } else {
                    return noResultsNotice(context, provider.message);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
