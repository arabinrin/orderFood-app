import 'package:flutter/material.dart';
import 'package:food_course/models/popular.dart';
import 'package:food_course/provider/restaurant.dart';
import 'package:food_course/src/widget/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({Key? key}) : super(key: key);

  @override
  _PopularCardState createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: restaurantProvider.restaurants.length,
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(2),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withOpacity(.2),
                              offset: Offset(4, 6),
                              blurRadius: 10,
                            ),
                          ],
                          image: DecorationImage(
                              image: NetworkImage(
                                  restaurantProvider.restaurants[i].image),
                              fit: BoxFit.fill),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Loading(),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: restaurantProvider.restaurants[i].image,
                                fit: BoxFit.fill,
                                height: 198,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                          ],
                        )),
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
                                  '${restaurantProvider.restaurants[i].rating}',
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
                          padding: EdgeInsets.all(10),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.6),
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
                                    text:
                                        "${restaurantProvider.restaurants[i].name}\n",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: 'at: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text:
                                        '${restaurantProvider.restaurants[i].address}',
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
                                text:
                                    '\$ ${restaurantProvider.restaurants[i].avgPrice}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ], style: TextStyle(color: Colors.white))),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          );
        });
  }
}
