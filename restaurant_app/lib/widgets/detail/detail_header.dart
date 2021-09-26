import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/provider/database_provider.dart';

class DetailHeader extends StatelessWidget {
  final Restaurant restaurant;

  const DetailHeader({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
          future: provider.isFavorited(restaurant.id),
          builder: (context, snapshot) {
            var isFavorited = snapshot.data ?? false;

            return Container(
              width: double.infinity,
              height: screenSize.height * .5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: darkBlueGrey),
                          onPressed: () => Navigation.back(),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: cream,
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: isFavorited
                            ? IconButton(
                                icon: Icon(Icons.favorite),
                                color: Colors.redAccent,
                                onPressed: () =>
                                    provider.removeFavorite(restaurant.id),
                              )
                            : IconButton(
                                icon: Icon(Icons.favorite_border),
                                color: Colors.redAccent,
                                onPressed: () =>
                                    provider.addFavorite(restaurant),
                              ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: cream,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
