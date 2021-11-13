import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_course/models/restaurants.dart';

class RestuarantsServices {
  String collection = "restuarant";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<OrderRestaurant>> getRestaurant() async =>
      _firestore.collection(collection).get().then((result) {
        List<OrderRestaurant> restaurants = [];
        for (DocumentSnapshot restaurant in result.docs) {
          restaurants.add(OrderRestaurant.fromSnapshot(restaurant));
        }
        return restaurants;
      });
}
