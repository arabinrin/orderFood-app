import 'package:flutter/material.dart';
import 'package:food_course/models/popular.dart';

List<Popular> popularList = [
  Popular(
      image: 'steak1.jpg',
      price: 7.99,
      rating: 4.0,
      special: 'Steak',
      cook: 'Pizza Hut'),
  Popular(
      image: 'steak2.jpg',
      price: 12.97,
      rating: 4.0,
      special: 'Pancake',
      cook: '4 friends'),
  Popular(
      image: 'steak3.jpg',
      price: 4.00,
      rating: 4.0,
      special: 'Meat Red',
      cook: 'Pizza Hut'),
];

class PopularCard extends StatefulWidget {
  const PopularCard({Key? key}) : super(key: key);

  @override
  _PopularCardState createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: popularList.length,
        itemBuilder: (_, i) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('images/${popularList[i].image}'),
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
                            Icon(Icons.star, size: 18, color: Colors.redAccent),
                            Text(
                              '${popularList[i].rating}',
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
                                text: "${popularList[i].special}\n",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'by: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            TextSpan(
                                text: '${popularList[i].cook}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                            text: '\$ ${popularList[i].price}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal))
                      ], style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
              )),
            ],
          );
        });
  }
}
