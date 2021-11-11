import 'package:flutter/material.dart';
import 'package:food_course/helper/navigations.dart';
import 'package:food_course/models/product.dart';
import 'package:food_course/src/screen/detail.dart';
import 'package:food_course/src/widget/title.dart';

List<ProductModel> productsList = [];

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 250,
      width: MediaQuery.of(context).size.width * .95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                changeScreen(_, Details(product: productsList[i]));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                height: 230,
                width: 190,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(.2),
                        offset: Offset(6, 4),
                        blurRadius: 10,
                      )
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 105,
                      width: 105,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(productsList[i].image),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: CustomTitle(
                              text: productsList[i].name,
                              size: 14,
                              weight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      offset: Offset(4, 6),
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Icon(
                                productsList[i].featured
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CustomTitle(
                                  text: productsList[i]
                                      .rating
                                      .toDouble()
                                      .toString(),
                                  size: 16,
                                  weight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(width: 3),
                            Icon(Icons.star, color: Colors.red, size: 14),
                            Icon(Icons.star, color: Colors.red, size: 14),
                            Icon(Icons.star, color: Colors.red, size: 14),
                            Icon(Icons.star_outline,
                                color: Colors.red, size: 14),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            '\$ ${productsList[i].price}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // _rating(double rating) {
  //   return Row(
  //     children: <Widget>[
  //       ListView.builder(
  //           itemCount: rating.toInt(),
  //           itemBuilder: (_, i) {
  //             return Icon(Icons.star, color: Colors.red, size: 14);
  //           }),
  //       ListView.builder(
  //           itemCount: 5 - rating.toInt(),
  //           itemBuilder: (_, i) {
  //             return Icon(Icons.star_border, color: Colors.red, size: 14);
  //           }),
  //     ],
  //   );
  // }
}
