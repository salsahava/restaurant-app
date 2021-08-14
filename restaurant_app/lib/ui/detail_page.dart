import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/rating.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: screenSize.height * .5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(restaurant.pictureId),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: defaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: darkBlueGrey),
                          onPressed: () => Navigator.pop(context),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: screenSize.height * .45),
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding + 10, vertical: defaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          restaurant.name,
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                                color: darkBlueGrey,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Rating(restaurant: restaurant),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.grey, size: 15),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: darkBlueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 8.0),
                  Text(restaurant.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
