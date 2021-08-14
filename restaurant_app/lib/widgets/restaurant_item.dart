import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/detail_page.dart';
import 'package:restaurant_app/widgets/rating.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItem({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 8.0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.network(
          restaurant.pictureId,
          width: 80,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        restaurant.name,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(fontWeight: FontWeight.bold, color: darkBlueGrey),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.place, color: Colors.grey, size: 15),
          Text(
            restaurant.city,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      trailing: Rating(restaurant: restaurant),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailPage.routeName,
            arguments: restaurant);
      },
    );
  }
}
