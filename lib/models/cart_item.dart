// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';

class CartItem {
  static const ID = 'id';
  static const NAME = 'name';
  static const PRODUCT_ID = 'productId';
  static const IMAGE = 'image';
  static const PRICE = 'price';
  static const QUANTITY = 'quatity';

  String _id;
  String _name;
  String _productId;
  String _image;
  double _price;
  int _quantity;

  //getters
  String get id => _id;
  String get name => _name;
  String get productId => _productId;
  String get image => _image;
  double get price => _price;
  int get quatity => _quantity;

  CartItem.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot[ID];
    _name = snapshot[NAME];
    _productId = snapshot[PRODUCT_ID];
    _image = snapshot[IMAGE];
    _price = snapshot[PRICE];
    _quantity = snapshot[QUANTITY];
  }
}
