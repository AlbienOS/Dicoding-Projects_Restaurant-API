

import 'package:collection/collection.dart';

class RestaurantResult {
  RestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  factory RestaurantResult.fromJson(Map<String, dynamic> json) => RestaurantResult(
    error: json["error"],
    message: json["message"],
    count: json["count"],
    restaurants: List<Restaurant>.from((json["restaurants"] as List)
        .map((x) => Restaurant.fromJson(x))
        .where((restaurants) =>
        restaurants.id != null &&
        restaurants.name != null &&
        restaurants.description != null &&
        restaurants.pictureId != null &&
        restaurants.city != null &&
        restaurants.rating != null)),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "count": count,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };

  @override
  bool operator == (Object otherData) {
    assert(otherData is RestaurantResult);
    final other = otherData as RestaurantResult;

    return error == other.error &&
        message == other.message &&
        count == other.count &&
        const ListEquality().equals(restaurants, other.restaurants);
  }
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String? pictureId;
  String city;
  double rating;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
  };

  @override
  bool operator == (Object otherData) {
    assert(otherData is Restaurant);
    final other = otherData as Restaurant;

    return id == other.id &&
        name == other.name &&
        description == other.description &&
        pictureId == other.pictureId &&
        city == other.city &&
        rating == other.rating;
  }
}

