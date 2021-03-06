import 'dart:convert';

import 'package:collection/collection.dart';

DetailRestaurantsResult detailRestaurantsResultFromJson(String str) => DetailRestaurantsResult.fromJson(json.decode(str));

String detailRestaurantsResultToJson(DetailRestaurantsResult data) => json.encode(data.toJson());

class DetailRestaurantsResult {
  DetailRestaurantsResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  DetailRestaurant restaurant;

  factory DetailRestaurantsResult.fromJson(Map<String, dynamic> json) => DetailRestaurantsResult(
    error: json["error"],
    message: json["message"],
    restaurant: DetailRestaurant.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurant.toJson(),
  };

  @override
  String toString() {
    return 'DetailRestaurantsResult{error: $error, message: $message, restaurant: $restaurant}';
  }

  @override
  bool operator == (Object otherData) {
    assert(otherData is DetailRestaurantsResult);
    final other = otherData as DetailRestaurantsResult;

    return error == other.error &&
        message == other.message &&
        restaurant == other.restaurant;
  }
}

class DetailRestaurant {
  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  double rating;
  List<Category> categories;
  Menus menus;
  List<CustomerReview> customerReviews;

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) => DetailRestaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    city: json["city"],
    address: json["address"],
    pictureId: json["pictureId"],
    rating: json["rating"].toDouble(),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    menus: Menus.fromJson(json["menus"]),
    customerReviews: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "city": city,
    "address": address,
    "pictureId": pictureId,
    "rating": rating,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "menus": menus.toJson(),
    "customerReviews": List<dynamic>.from(customerReviews.map((x) => x.toJson())),
  };


  @override
  String toString() {
    return 'DetailRestaurant{id: $id, name: $name, description: $description, city: $city, address: $address, pictureId: $pictureId, rating: $rating, categories: $categories, menus: $menus, customerReviews: $customerReviews}';
  }

  @override
  bool operator == (Object otherData) {
    assert(otherData is DetailRestaurant);
    final other = otherData as DetailRestaurant;

    return id == other.id &&
        name == other.name &&
        description == other.description &&
        city == other.city &&
        address == other.address &&
        pictureId == other.pictureId &&
        rating == other.rating &&
        ListEquality().equals(categories, other.categories) &&
        menus == other.menus &&
        ListEquality().equals(customerReviews, other.customerReviews);
  }

}

class Category {
  Category({
    required this.name,
  });

  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };


  @override
  String toString() {
    return 'Category{name: $name}';
  }

  @override
  bool operator == (Object otherData) {
    assert(otherData is Category);
    final other = otherData as Category;

    return
        name == other.name;
  }
}

class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json["name"],
    review: json["review"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "date": date,
  };


  @override
  String toString() {
    return 'CustomerReview{name: $name, review: $review, date: $date}';
  }

  @override
  bool operator == (Object otherData) {
    assert(otherData is CustomerReview);
    final other = otherData as CustomerReview;

    return
      name == other.name &&
      review == other.review &&
      date == other.date;
  }

}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  List<Category> foods;
  List<Category> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
    drinks: List<Category>.from(json["drinks"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };


  @override
  String toString() {
    return 'Menus{foods: $foods, drinks: $drinks}';
  }

  @override
  bool operator == (Object otherData) {
    assert(otherData is Menus);
    final other = otherData as Menus;

    return
      ListEquality().equals(foods, other.foods) &&
      ListEquality().equals(drinks, other.drinks);
  }
}
