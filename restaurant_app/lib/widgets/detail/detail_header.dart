import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';

class DetailHeader extends StatelessWidget {
  final RestaurantDetail restaurant;

  const DetailHeader({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
                  color: cream,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
