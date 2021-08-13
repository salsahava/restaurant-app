import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/widgets/search_bar.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding * 2.5),
      height: screenSize.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: defaultPadding * 1.5,
                right: defaultPadding * 1.5,
                bottom: 20 + defaultPadding),
            height: screenSize.height * 0.2,
            decoration: BoxDecoration(
              color: cream,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Restaurant App',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                Text('Find a variety of restaurants',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontWeight: FontWeight.bold, color: darkBlueGrey)),
              ],
            ),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}
