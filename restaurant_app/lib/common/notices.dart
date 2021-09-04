import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

Widget noInternetNotice(BuildContext context, Size screenSize) {
  return SizedBox(
    height: screenSize.height / 3,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, color: Colors.black12, size: 110),
          SizedBox(height: defaultPadding),
          Text(
            'No internet connection',
            style: TextStyle(
              color: Colors.black12,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget errorNotice(BuildContext context, Size screenSize) {
  return SizedBox(
    height: screenSize.height / 3,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.black12, size: 110),
          SizedBox(height: defaultPadding),
          Text(
            'Something went wrong. Please refresh the page to try again.',
            style: TextStyle(
              color: Colors.black12,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget noResultsNotice(BuildContext context, Size screenSize) {
  return SizedBox(
    height: screenSize.height / 3,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, color: Colors.black12, size: 72),
          SizedBox(height: defaultPadding),
          Text(
            'No results to display',
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
