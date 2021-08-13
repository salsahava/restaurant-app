import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/home_header.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, leading: Icon(Icons.menu)),
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: defaultPadding,
                left: defaultPadding,
                bottom: defaultPadding
              ),
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
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
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
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.bold, color: darkBlueGrey),
        ),
        subtitle: Text(restaurant.city),
        trailing: Text(
          restaurant.rating.toString(),
          textScaleFactor: 1.5,
          style: TextStyle(
            color: darkBlueGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
