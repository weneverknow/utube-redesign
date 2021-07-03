import 'package:flutter/material.dart';

class FeaturedIcon extends StatelessWidget {
  const FeaturedIcon({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(icon),
        Text(
          text,
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
