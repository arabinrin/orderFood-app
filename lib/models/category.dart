// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";

  int _id;
  String _name;
  String _image;

  int get id => _id;
  String get name => _name;
  String get image => _image;

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot[ID];
    _name = snapshot[NAME];
    _image = snapshot[IMAGE];
  }
}
