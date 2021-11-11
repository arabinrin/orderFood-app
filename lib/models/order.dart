// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = 'id';
  static const DESCRIPTION = "description";
  static const PRODUCT_ID = "productId";
  static const USER_ID = "userId";
  static const AMOUNT = "amount";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _description;
  String _productId;
  String _userId;
  int _amount;
  String _status;
  int _createdAt;

  String get id => _id;
  String get name => _description;
  String get productId => _productId;
  String get userId => _userId;
  int get amount => _amount;
  String get status => _status;
  int get createdAt => _createdAt;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot[ID];
    _description = snapshot[DESCRIPTION];
    _productId = snapshot[PRODUCT_ID];
    _userId = snapshot[USER_ID];
    _amount = snapshot[AMOUNT];
    _status = snapshot[STATUS];
    _createdAt = snapshot[CREATED_AT];
  }
}
