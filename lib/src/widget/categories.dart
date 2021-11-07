import 'package:flutter/material.dart';
import 'package:food_course/models/category.dart';
import 'package:food_course/src/widget/title.dart';

List<Category> categoriesList = [
  Category(name: 'Salad', image: 'salad.png'),
  Category(name: 'pizza', image: 'pizza.png'),
  Category(name: 'French fires', image: 'french-fries.png'),
  Category(name: 'Donut', image: 'donut.png'),
  Category(name: 'Spagetti', image: 'food1.jpg'),
  Category(name: 'Steak', image: 'food5.jpg'),
  Category(name: 'Cream Beans', image: 'food2.jpg'),
];

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (_, i) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(.2),
                            offset: Offset(4, 6),
                            blurRadius: 10,
                          )
                        ]),
                    child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          'images/${categoriesList[i].image}',
                          width: 50,
                          height: 50,
                        )),
                  ),
                  SizedBox(height: 5),
                  CustomTitle(
                    text: categoriesList[i].name,
                    color: Colors.grey,
                    weight: FontWeight.normal,
                    size: 14,
                  )
                ]),
              );
            }));
  }
}
