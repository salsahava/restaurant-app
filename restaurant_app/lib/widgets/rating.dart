import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class Rating extends StatelessWidget {
  final double rating;

  const Rating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.star, color: Colors.white, size: 15),
          Text(
            rating.toString(),
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
