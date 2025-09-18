import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key, required this.text, required this.iconData});
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(spacing: 4, children: [Text(text), Icon(iconData)]),
    );
  }
}
