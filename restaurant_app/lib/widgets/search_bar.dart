import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        height: 45,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Search a restaurant",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              icon: Icon(Icons.search, color: Colors.grey),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}
