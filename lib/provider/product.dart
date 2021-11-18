import 'package:flutter/material.dart';
import 'package:food_course/helper/product.dart';
import 'package:food_course/models/product.dart';

class ProductProvider with ChangeNotifier {
  ProductsServices _productsServices = ProductsServices();
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByRestaurants = [];

  ProductProvider.initialize() {
    loadProducts();
  }
loadProducts() async {
    products = await _productsServices.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String? categoryName}) async {
    productsByCategory =
        await _productsServices.getProductByCategory(category: categoryName);
    notifyListeners();
  }

  Future loadProductsByRestaurant({String? restaurantId}) async {
    productsByRestaurants =
        await _productsServices.getProductByRestaurants(id: restaurantId);
    notifyListeners();
  }
}
