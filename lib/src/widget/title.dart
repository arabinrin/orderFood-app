import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  double size = 16;
  Color color = Colors.black;
  FontWeight weight = FontWeight.normal;
  CustomTitle(
      {required this.text,
      required this.size,
      required this.color,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
