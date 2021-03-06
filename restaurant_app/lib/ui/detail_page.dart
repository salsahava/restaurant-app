import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/menu_item.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/detail/detail_header.dart';
import 'package:restaurant_app/widgets/detail/menu_item_card.dart';
import 'package:restaurant_app/widgets/rating.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DetailHeader(restaurant: restaurant),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: screenSize.height * .45),
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding + 10, vertical: defaultPadding),
              decoration: BoxDecoration(
                color: cream,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUpperInfo(context),
                  _buildLocation(context),
                  SizedBox(height: defaultPadding),
                  _buildSectionTitle(context, 'Description'),
                  SizedBox(height: 8.0),
                  Text(restaurant.description),
                  SizedBox(height: defaultPadding),
                  _buildSectionTitle(context, 'Foods'),
                  _buildMenuItemList(context, restaurant.menus.foods),
                  SizedBox(height: defaultPadding),
                  _buildSectionTitle(context, 'Drinks'),
                  _buildMenuItemList(context, restaurant.menus.drinks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpperInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Hero(
            tag: restaurant.id,
            child: Text(
              restaurant.name,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: darkBlueGrey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Rating(restaurant: restaurant),
      ],
    );
  }

  Widget _buildLocation(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.place, color: Colors.grey, size: 15),
        Text(
          restaurant.city,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: darkBlueGrey,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  Widget _buildMenuItemList(BuildContext context, List<MenuItem> items) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final MenuItem item = items[index];
          return MenuItemCard(item: item);
        },
      ),
    );
  }
}
