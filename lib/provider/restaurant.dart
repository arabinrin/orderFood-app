import 'package:flutter/material.dart';
import 'package:food_course/helper/restaurant.dart';
import 'package:food_course/models/restaurants.dart';

class RestaurantProvider with ChangeNotifier {
  RestuarantsServices _restaurantsServices = RestuarantsServices();
  List<OrderRestaurant> restaurants = [];

  RestaurantProvider.initialize() {
    _loadRestaurants();
  }
  _loadRestaurants() async {
    restaurants = await _restaurantsServices.getRestaurant();
    notifyListeners();
  }
}
