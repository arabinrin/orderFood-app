// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = 'id';
  static const NAME = "name";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const RATE = "RATE";

  String _id;
  String _name;
  double _rating;
  String _image;
  double _price;
  String _restaurantId;
  String _restaurant;
  String _category;
  bool _featured;
  int _rate;

  String get id => _id;
  String get name => _name;
  double get rating => _rating;
  String get image => _image;
  double get price => _price;
  String get restaurantId => _restaurantId;
  String get restaurant => _restaurant;
  String get category => _category;
  bool get featured => _featured;
  int get rate => _rate;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot[ID];
    _name = snapshot[NAME];
    _rating = snapshot[RATING];
    _image = snapshot[IMAGE];
    _price = snapshot[PRICE];
    _restaurantId = snapshot[RESTAURANT_ID];
    _restaurant = snapshot[RESTAURANT];
    _category = snapshot[CATEGORY];
    _featured = snapshot[FEATURED];
    _rate = snapshot[RATE];
  }
}
