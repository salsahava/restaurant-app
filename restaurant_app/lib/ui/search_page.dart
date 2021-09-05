import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/notices.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/search_result.dart';
import 'package:restaurant_app/widgets/home/restaurant_item.dart';
import 'package:restaurant_app/widgets/home/search_bar.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: darkBlueGrey),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchHeader(context),
            query == null
                ? noResultsNotice(context, 'No results to display')
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding),
                      child: FutureBuilder(
                        future: ApiService().searchRestaurant(query!),
                        builder:
                            (context, AsyncSnapshot<SearchResult> snapshot) {
                          var state = snapshot.connectionState;

                          if (state != ConnectionState.done) {
                            return Center(
                              child: CircularProgressIndicator(
                                  color: darkBlueGrey),
                            );
                          } else if (state == ConnectionState.none) {
                            return noInternetNotice(
                                context, 'No internet connection');
                          } else {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data?.restaurants.length,
                                itemBuilder: (context, index) {
                                  var searchResult =
                                      snapshot.data?.restaurants[index];
                                  return RestaurantItem(
                                      restaurant: searchResult!);
                                },
                              );
                            } else if (snapshot.hasError) {
                              return errorNotice(context,
                                  'Something went wrong. Please refresh the page to try again.');
                            } else {
                              return Center(child: Text(''));
                            }
                          }
                        },
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Search for your favorite restaurants and menus',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.bold, color: darkBlueGrey),
              ),
            ],
          ),
        ),
        SearchBar(onSearch: (q) {
          setState(() {
            query = q;
          });
        }),
      ],
    );
  }
}
