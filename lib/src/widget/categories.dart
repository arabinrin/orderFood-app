import 'package:flutter/material.dart';
import 'package:food_course/models/category.dart';
import 'package:food_course/provider/category.dart';
import 'package:food_course/src/widget/loading.dart';
import 'package:food_course/src/widget/title.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

List<CategoryModel> categoriesList = [];

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryProvider.categories.length,
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
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              ),
                            ),
                            Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: categoryProvider.categories[i].image,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 5),
                  CustomTitle(
                    text: categoryProvider.categories[i].name,
                    color: Colors.grey,
                    weight: FontWeight.normal,
                    size: 14,
                  )
                ]),
              );
            }));
  }
}
