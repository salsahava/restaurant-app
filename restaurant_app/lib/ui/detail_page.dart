import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/notices.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/customer_review.dart';
import 'package:restaurant_app/data/model/menu_item.dart';
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/widgets/detail/detail_header.dart';
import 'package:restaurant_app/widgets/detail/menu_item_card.dart';
import 'package:restaurant_app/widgets/rating.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';

  final String restaurantId;

  const RestaurantDetailPage({required this.restaurantId});

  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  Future<RestaurantDetailResult>? _restaurantDetail;
  late RestaurantDetail restaurantDetail;

  @override
  void initState() {
    super.initState();
    _restaurantDetail = ApiService().getRestaurantDetail(widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _restaurantDetail,
      builder: (context, AsyncSnapshot<RestaurantDetailResult> snapshot) {
        var state = snapshot.connectionState;

        if (state != ConnectionState.done) {
          return Center(child: CircularProgressIndicator(color: darkBlueGrey));
        } else if (state == ConnectionState.none) {
          return noInternetNotice(context, 'No internet connection');
        } else {
          if (snapshot.hasData) {
            restaurantDetail = snapshot.data!.restaurantDetail;
            return _buildDetailPage(context, restaurantDetail);
          } else if (snapshot.hasError) {
            return errorNotice(context,
                'Something went wrong. Please refresh the page to try again.');
          } else {
            return Text('');
          }
        }
      },
    );
  }

  Widget _buildDetailPage(
      BuildContext context, RestaurantDetail restaurantDetail) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: cream,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DetailHeader(restaurant: restaurantDetail),
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
                  Text(restaurantDetail.description),
                  SizedBox(height: defaultPadding),
                  _buildSectionTitle(context, 'Foods'),
                  _buildMenuItemList(context, restaurantDetail.menus.foods),
                  SizedBox(height: defaultPadding),
                  _buildSectionTitle(context, 'Drinks'),
                  _buildMenuItemList(context, restaurantDetail.menus.drinks),
                  SizedBox(height: defaultPadding),
                  _buildSectionTitle(context, 'Reviews'),
                  _buildReviewList(context, restaurantDetail.customerReviews),
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
            tag: restaurantDetail.id,
            child: Text(
              restaurantDetail.name,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: darkBlueGrey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Rating(rating: restaurantDetail.rating),
      ],
    );
  }

  Widget _buildLocation(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.place, color: Colors.grey, size: 15),
        Text(
          restaurantDetail.city,
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

  Widget _buildReviewList(BuildContext context, List<CustomerReview> reviews) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            final CustomerReview review = reviews[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                title: Text(
                  review.name,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold, color: darkBlueGrey),
                ),
                subtitle: Text(
                  review.review,
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
