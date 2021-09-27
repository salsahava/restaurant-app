import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getRestaurantList Test', () {
    test(
        'should return a RestaurantResult if the http call completes successfully',
        () async {
      final client = MockClient();

      when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
          .thenAnswer(
        (_) async => http.Response(
            '{"error": false, "message": "success", "count": 1, "restaurants": [{"id":"rdv5juekfw1e87","name":"Mock Restaurant","description":"Lorem ipsum dolor sit amet, consectetuer adipiscing elit.","pictureId":"8","city":"Jakarta","rating":4.2}]}',
            200),
      );

      expect(await ApiService(client).getRestaurantList(),
          isA<RestaurantResult>());
    });
  });

  test('should throw and exception if the http call completes with an error',
      () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://restaurant-api.dicoding.dev/list')))
        .thenAnswer((_) async => http.Response('Not Found', 404));

    expect(ApiService(client).getRestaurantList(), throwsException);
  });
}
