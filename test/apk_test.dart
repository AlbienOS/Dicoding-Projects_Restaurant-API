import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:submission_restaurant_api/data/api/api_service.dart';
import 'package:submission_restaurant_api/data/model/detail_restaurant.dart';
import 'apk_test.mocks.dart' as mock;

@GenerateMocks([http.Client])
void main() {
  group('Restaurant Testing', () {
    final mockClient = mock.MockClient();
    const baseUrl = 'https://restaurant-api.dicoding.dev/';
    test('Exception 404', () async {
      when(mockClient.get(Uri.parse(baseUrl + 'detail/rqdv5juczeskfw1e867')))
          .thenAnswer((realInvocation) async => http.Response('', 404));

      expect(ApiService().topDetail('rqdv5juczeskfw1e867', mockClient),
          throwsException);
    });
    test('must return correct data for DetailRestaurantsResults', () async {
      const response = '''
      {
          "error": false,
          "message": "success",
          "restaurant": {
           "id": "rqdv5juczeskfw1e867",
           "name": "Melting Pot",
           "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "rating": 4.2,
        "categories": [
            {
                "name": "Italia"
            },
            {
                "name": "Modern"
            }
        ],
        "menus": {
            "foods": [
                {
                    "name": "Paket rosemary"
                },
                {
                    "name": "Toastie salmon"
                },
                {
                    "name": "Bebek crepes"
                },
                {
                    "name": "Salad lengkeng"
                }
            ],
            "drinks": [
               {
                    "name": "Es krim"
                },
                {
                    "name": "Sirup"
                },
                {
                    "name": "Jus apel"
                },
                {
                    "name": "Jus jeruk"
                },
                {
                    "name": "Coklat panas"
                },
                {
                    "name": "Air"
                },
                {
                    "name": "Es kopi"
                },
                {
                    "name": "Jus alpukat"
                },
                {
                    "name": "Jus mangga"
                },
                {
                    "name": "Teh manis"
                },
                {
                    "name": "Kopi espresso"
                },
                {
                    "name": "Minuman soda"
                },
                {
                    "name": "Jus tomat"
                }
            ]
        },
        "customerReviews": [
          {
              "name": "Ahmad",
              "review": "Tidak rekomendasi untuk pelajar!",
              "date": "13 November 2019"
          },
          {
              "name": "Test",
              "review": "Test",
              "date": "23 November 2021"
          },
          {
              "name": "E2E testing",
              "review": "Enak makanannya!",
              "date": "23 November 2021"
          }
        ]
      }
    }
    ''';

      final expected = DetailRestaurantsResult(
          error: false,
          message: "success",
          restaurant: DetailRestaurant(
              id: "rqdv5juczeskfw1e867",
              name: "Melting Pot",
              description:
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
              city: "Medan",
              address: "Jln. Pandeglang no 19",
              pictureId: "14",
              rating: 4.2,
              categories: [
                Category(name: "Italia"),
                Category(name: "Modern")
              ],
              menus: Menus(
                  foods: [
                Category(name: "Paket rosemary"),
                Category(name: "Toastie salmon"),
                Category(name: "Bebek crepes"),
                Category(name: "Salad lengkeng")
              ],
                  drinks: [
                Category(name: "Es krim"),
                Category(name: "Sirup"),
                Category(name: "Jus apel"),
                Category(name: "Jus jeruk"),
                Category(name: "Coklat panas"),
                Category(name: "Air"),
                Category(name: "Es kopi"),
                Category(name: "Jus alpukat"),
                Category(name: "Jus mangga"),
                Category(name: "Teh manis"),
                Category(name: "Kopi espresso"),
                Category(name: "Minuman soda"),
                Category(name: "Jus tomat")
              ]
              ),
              customerReviews: [
                CustomerReview(
                    name: "Ahmad",
                    review: "Tidak rekomendasi untuk pelajar!",
                    date: "13 November 2019"),
                CustomerReview(
                    name: "Test",
                    review: "Test",
                    date: "23 November 2021"),
                CustomerReview(
                    name: "E2E testing",
                    review: "Enak makanannya!",
                    date: "23 November 2021")
              ])
      );

      when(mockClient.get(Uri.parse(baseUrl + 'detail/rqdv5juczeskfw1e867')))
          .thenAnswer((realInvocation) async => http.Response(response, 200));

      expect(await ApiService().topDetail('rqdv5juczeskfw1e867', mockClient),
          expected);
    });
    test('must have no other key besides the defined by one of the restaurants',
        () async {
      const response = '''{
    "error": false,
    "message": "success",
    "restaurant": {
        "id": "09809uyyt",
        "name": "Melting Pot",
        "description": "HuhuhahaHehe",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "categories": [
            {
                "name": "Italia"
            },
            {
                "name": "Modern"
            }
        ],
        "menus": {
            "foods": [
                {
                    "name": "Paket rosemary"
                },
                {
                    "name": "Toastie salmon"
                }
            ],
            "drinks": [
                {
                    "name": "Es krim"
                },
                {
                    "name": "Sirup"
                }
            ]
        },
        "rating": 4.2,
        "customerReviews": [
            {
                "name": "Ahmad",
                "review": "Tidak rekomendasi untuk pelajar!",
                "date": "13 November 2019"
            }
        ]
    }
  }
      ''';
      when(mockClient.get(Uri.parse(baseUrl + 'detail/rqdv5juczeskfw1e867')))
          .thenAnswer((realInvocation) async => http.Response(response, 200));
      expect(
          (await ApiService().topDetail('rqdv5juczeskfw1e867', mockClient))
              .toJson()['description1'],
          null);
    });
  });
}
