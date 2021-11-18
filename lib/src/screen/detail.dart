import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:food_course/helper/navigations.dart';
import 'package:food_course/models/product.dart';
import 'package:food_course/src/screen/cart.dart';

class Details extends StatefulWidget {
  final ProductModel product;
  Details({required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              changeScreen(context, ShoppingCart());
            },
          ),
        ],
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Stack(
              children: [
                ClipRRect(
                  child: Carousel(
                    images: [
                      NetworkImage('${widget.product.image}'),
                      NetworkImage('${widget.product.image}'),
                      NetworkImage('${widget.product.image}'),
                    ],
                    dotBgColor: Colors.white,
                    dotColor: Colors.grey,
                    dotIncreasedColor: Colors.redAccent,
                    dotIncreaseSize: 1.2,
                    autoplay: false,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    widget.product.name,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "\$${widget.product.price / 100}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.product.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                  wordSpacing: 1.5),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 36,
                    ),
                    onPressed: () {
                      if (quantity != 1) {
                        setState(() {
                          quantity -= 1;
                        });
                      }
                    }),
              ),
              // GestureDetector(
              //   onTap: () async {
              //     app.changeLoading();
              //     print("All set loading");

              //     bool value = await user.addToCard(
              //         product: widget.product, quantity: quantity);
              //     if (value) {
              //       print("Item added to cart");
              //       _key.currentState.showSnackBar(
              //           SnackBar(content: Text("Added ro Cart!")));
              //       user.reloadUserModel();
              //       app.changeLoading();
              //       return;
              //     } else {
              //       print("Item NOT added to cart");
              //     }
              //     print("lOADING SET TO FALSE");
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: primary,
              //         borderRadius: BorderRadius.circular(20)),
              //     child: app.isLoading
              //         ? Loading()
              //         : Padding(
              //             padding:
              //                 const EdgeInsets.fromLTRB(28, 12, 28, 12),
              //             child: CustomText(
              //               text: "Add $quantity To Cart",
              //               color: white,
              //               size: 22,
              //               weight: FontWeight.w300,
              //             ),
              //           ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 36,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        quantity += 1;
                      });
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
