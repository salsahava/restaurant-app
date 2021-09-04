import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class SearchBar extends StatefulWidget {
  final void Function(String search) onSearch;

  SearchBar({required this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      height: 45,
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search for a restaurant",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            icon: Icon(Icons.search, color: Colors.grey),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
        onChanged: (value) {
          widget.onSearch(value);
        },
      ),
    );
  }
}
