import 'package:flutter/material.dart';
import 'package:food_course/helper/navigations.dart';
import 'package:food_course/src/screen/cart.dart';
import 'package:food_course/src/widget/categories.dart';
import 'package:food_course/src/widget/featured_products.dart';
import 'package:food_course/src/widget/nav_bar.dart';
import 'package:food_course/src/widget/title.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomTitle(
                        text: 'What are you looking for',
                        color: Colors.black,
                        weight: FontWeight.normal,
                        size: 18,
                      )),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none),
                      ),
                      Positioned(
                        top: 11,
                        right: 13,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4, 4),
                      blurRadius: 15,
                    )
                  ]),
                  child: ListTile(
                    trailing: Icon(Icons.filter_list, color: Colors.red),
                    leading: Icon(Icons.search, color: Colors.red),
                    title: TextField(
                        decoration: InputDecoration(
                      hintText: 'Find the food and resturant',
                      border: InputBorder.none,
                    )),
                  ),
                ),
              ),
              Categories(),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.5),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTitle(
                        text: 'Featured',
                        size: 16,
                        color: Colors.white,
                        weight: FontWeight.bold),
                  ),
                ],
              ),
              FeaturedProduct(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.5),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTitle(
                        text: 'Popular',
                        size: 16,
                        color: Colors.white,
                        weight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('images/food5.jpg'),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(.2),
                            offset: Offset(4, 6),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Icon(Icons.favorite, color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 50,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.star,
                                    size: 18, color: Colors.redAccent),
                                Text(
                                  '4.5',
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.7),
                                Colors.black.withOpacity(.6),
                                Colors.black.withOpacity(.5),
                                Colors.black.withOpacity(.4),
                                Colors.black.withOpacity(.3),
                                Colors.black.withOpacity(.1),
                              ],
                            ),
                          )),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(14),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Pancake\n',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'by: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text: 'Pizza Hut',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '\$ 12.99',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal))
                          ], style: TextStyle(color: Colors.white))),
                        ),
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
          bottomNavigationBar: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: NAvBar(
                      image: 'images/home.png',
                      name: 'Home',
                    ),
                  ),
                  NAvBar(
                    image: 'images/near-me.png',
                    name: 'Home',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingCart()));
                    },
                    child: NAvBar(
                      image: 'images/shopping-cart.png',
                      name: 'Home',
                    ),
                  ),
                  NAvBar(
                    image: 'images/user.png',
                    name: 'Home',
                  ),
                ],
              ))),
    );
  }
}
