import 'package:flutter/material.dart';
import '../helper/category.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  CategoriesServices _categoriesServices = CategoriesServices();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize() {
    _loadCategories();
  }
  _loadCategories() async {
    categories = await _categoriesServices.getCategories();
    notifyListeners();
  }
}
