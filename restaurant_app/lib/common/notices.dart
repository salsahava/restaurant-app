import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

Widget noInternetNotice(BuildContext context, String message) {
  return SizedBox(
    height: 150,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.black12, size: 72),
          SizedBox(height: defaultPadding),
          Text(
            message,
            style: TextStyle(
              color: Colors.black12,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget errorNotice(BuildContext context, String message) {
  return SizedBox(
    height: 150,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.black12, size: 72),
          SizedBox(height: defaultPadding),
          Text(
            message,
            style: TextStyle(
              color: Colors.black12,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget noResultsNotice(BuildContext context, String message) {
  return SizedBox(
    height: 150,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, color: Colors.black12, size: 72),
          SizedBox(height: defaultPadding),
          Text(
            message,
            style: TextStyle(
              color: Colors.black12,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
