import 'package:flutter/material.dart';

class NAvBar extends StatelessWidget {
  final String image;
  final String name;
  const NAvBar({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 20,
            height: 20,
          ),
          SizedBox(height: 2),
          Text(name, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
