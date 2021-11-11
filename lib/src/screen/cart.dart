import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_course/models/product.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child:
                Image.asset('images/shopping-cart.png', width: 25, height: 25),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          //     child: Container(
          //       padding: EdgeInsets.all(10),
          //       height: 150,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.red.withOpacity(.2),
          //             offset: Offset(3, 6),
          //             blurRadius: 20,
          //           ),
          //         ],
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: <Widget>[
          //           Container(
          //             height: 105,
          //             width: 105,
          //             decoration: BoxDecoration(
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey,
          //                   offset: Offset(1, 1),
          //                   blurRadius: 3,
          //                 ),
          //               ],
          //               shape: BoxShape.circle,
          //               image: DecorationImage(
          //                   image: AssetImage(product.image), fit: BoxFit.fill),
          //             ),
          //           ),
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(top: 30),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: <Widget>[
          //                     RichText(
          //                       text: TextSpan(
          //                         children: [
          //                           TextSpan(
          //                             text: product.name + '\n ',
          //                             style: TextStyle(
          //                                 color: Colors.black,
          //                                 letterSpacing: 1.2),
          //                           ),
          //                           TextSpan(
          //                             text: '\$' + product.price.toString(),
          //                             style: TextStyle(color: Colors.black),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       width: 100,
          //                     ),
          //                     IconButton(
          //                         onPressed: () {},
          //                         icon: Icon(
          //                           Icons.delete_outline,
          //                           color: Colors.black,
          //                         ))
          //                   ],
          //                 ),
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: <Widget>[
          //                   IconButton(
          //                       onPressed: () {},
          //                       icon: Icon(
          //                         Icons.remove,
          //                         color: Colors.red,
          //                         size: 20,
          //                       )),
          //                   GestureDetector(
          //                     onTap: () {},
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                           color: Colors.red,
          //                           borderRadius: BorderRadius.circular(10)),
          //                       child: Padding(
          //                         padding: EdgeInsets.symmetric(
          //                             horizontal: 12, vertical: 8),
          //                         child: Text(
          //                           'Add to Cart',
          //                           style: TextStyle(
          //                             color: Colors.white,
          //                             fontSize: 14,
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   IconButton(
          //                       onPressed: () {},
          //                       icon: Icon(Icons.add, color: Colors.red)),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
