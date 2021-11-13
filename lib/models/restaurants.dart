// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRestaurant {
  static const ID = 'id';
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const RATE = "rate";
  static const ADDRESS = "address";
  static const IMAGE = "image";
  static const POPULAR = "popular";

  int _id;
  String _name;
  double _avgPrice;
  double _rating;
  int _rate;
  String _image;
  String _address;
  bool _popular;

  int get id => _id;
  String get name => _name;
  double get avgPrice => _avgPrice;
  double get rating => _rating;
  int get rate => _rate;
  String get image => _image;
  String get address => _address;
  bool get popular => _popular;

  OrderRestaurant.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot[ID];
    _name = snapshot[NAME];
    _avgPrice = snapshot[AVG_PRICE];
    _rating = snapshot[RATING];
    _rate = snapshot[RATE];
    _image = snapshot[IMAGE];
    _popular = snapshot[POPULAR];
    _address = snapshot[ADDRESS];
  }
}
