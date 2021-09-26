import 'dart:convert';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;
  int _randomNumber = 0;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        print('notification payload: ' + payload);
      }

      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      RestaurantResult restaurantsResult) async {
    var _channelId = "1";
    var _channelName = "channel_01";
    var _channelDescription = "restaurant recommendations channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        _channelId, _channelName, _channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: DefaultStyleInformation(true, true));

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    Random random = new Random();
    _randomNumber = random.nextInt(restaurantsResult.restaurants.length - 1);

    var notificationTitle = "<b>Restaurant Recommendation<b>";
    var restaurantName = restaurantsResult.restaurants[_randomNumber].name;

    print(restaurantName);

    await flutterLocalNotificationsPlugin.show(
      0,
      notificationTitle,
      restaurantName,
      platformChannelSpecifics,
      payload: json.encode(
          {"random_number": _randomNumber, "data": restaurantsResult.toJson()}),
    );
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      var data = RestaurantResult.fromJson(json.decode(payload)["data"]);
      var restaurant = data.restaurants[json.decode(payload)["random_number"]];

      print(restaurant.name);

      Navigation.intentWithData(route, restaurant);
    });
  }
}
