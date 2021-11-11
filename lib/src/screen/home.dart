import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_course/helper/navigations.dart';
import 'package:food_course/provider/category.dart';
import 'package:food_course/provider/user.dart';
import 'package:food_course/src/screen/cart.dart';
import 'package:food_course/src/widget/Popular_card.dart';
import 'package:food_course/src/widget/categories.dart';
import 'package:food_course/src/widget/featured_products.dart';
import 'package:food_course/src/widget/nav_bar.dart';
import 'package:food_course/src/widget/title.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    decoration:
                        BoxDecoration(color: Colors.red.withOpacity(.5)),
                    accountName: Text(
                      userProvider.userModel!.name.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    accountEmail: Text(
                      userProvider.userModel!.email!.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                    )),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Account'),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.red.withOpacity(.5),
            title: Text(
              'Food House',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0.5,
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingCart()));
                    },
                    icon: Icon(Icons.shopping_cart),
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.red.withOpacity(.7),
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
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
                PopularCard()
              ],
            ),
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
