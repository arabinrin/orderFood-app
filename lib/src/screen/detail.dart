import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:food_course/models/product.dart';

class Details extends StatefulWidget {
  final Product product;
  Details({required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  Carousel(
                    images: [
                      AssetImage('${widget.product.image}'),
                      AssetImage('${widget.product.image}'),
                      AssetImage('${widget.product.image}'),
                    ],
                    dotBgColor: Colors.white,
                    dotColor: Colors.grey,
                    dotIncreasedColor: Colors.redAccent,
                    dotIncreaseSize: 1.2,
                    autoplay: false,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white.withOpacity(.4),
                          Colors.white.withOpacity(.5),
                          Colors.white.withOpacity(.6),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            children: <Widget>[
                              Image.asset('images/shopping-cart.png',
                                  width: 25, height: 25),
                              Positioned(
                                child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(1, 1),
                                          blurRadius: 3,
                                        )
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        '2',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 14,
                    bottom: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              offset: Offset(2, 2),
                              blurRadius: 3,
                            )
                          ], shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.favorite, color: Colors.red)),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(.1),
                        offset: Offset(2, 2),
                        blurRadius: 5)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: widget.product.name + '\n',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'by: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: 'Pizza Hut',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Text("\$" + widget.product.price.toString(),
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(.1),
                        offset: Offset(2, 2),
                        blurRadius: 5)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red,
                          size: 25,
                        )),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: Colors.red)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.red.withOpacity(.1),
                      offset: Offset(2, 2),
                      blurRadius: 5)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
