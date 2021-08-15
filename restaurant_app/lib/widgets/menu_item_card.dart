import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/model/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * .5,
      height: 185,
      margin: EdgeInsets.only(
        left: defaultPadding,
        top: defaultPadding / 2,
        bottom: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
              height: 145,
              width: screenSize.width * .5,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset('assets/placeholder.jpg',
                      fit: BoxFit.cover))),
          Container(
            width: screenSize.width * .5,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              item.name,
              textAlign: TextAlign.start,
              style:
                  TextStyle(color: darkBlueGrey, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
