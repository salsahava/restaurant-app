import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/ui/detail_page.dart';
import 'package:restaurant_app/ui/home_page.dart';
import 'package:restaurant_app/ui/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        scaffoldBackgroundColor: cream,
        cardColor: Colors.white,
        buttonColor: darkBlueGrey,
        accentColor: darkBlueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: myTextTheme.apply(displayColor: darkBlueGrey),
        appBarTheme: AppBarTheme(
          color: cream,
          textTheme: myTextTheme.apply(displayColor: darkBlueGrey),
          iconTheme: IconThemeData(color: darkBlueGrey),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        SearchPage.routeName: (context) => SearchPage(),
      },
    );
  }
}
