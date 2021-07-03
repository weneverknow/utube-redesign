import 'package:flutter/material.dart';
import 'package:you_tube/widgets/category_title.dart';

class HistorySubTitle extends StatelessWidget {
  const HistorySubTitle({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CategoryTitle(title: title),
          const SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            size: 30,
          )
        ],
      ),
    );
  }
}
