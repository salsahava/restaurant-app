import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

class Rating extends StatelessWidget {
  final Restaurant restaurant;

  const Rating({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, color: Colors.white, size: 15),
          Text(
            restaurant.rating.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: darkBlueGrey,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );
  }
}
