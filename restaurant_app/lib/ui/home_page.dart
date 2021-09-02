import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/widgets/home/home_header.dart';
import 'package:restaurant_app/widgets/home/restaurant_list.dart';
import 'package:restaurant_app/widgets/home/search_bar.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: [Icon(Icons.menu), SizedBox(width: defaultPadding)]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            SearchBar(),
            RestaurantList(),
          ],
        ),
      ),
    );
  }
}
