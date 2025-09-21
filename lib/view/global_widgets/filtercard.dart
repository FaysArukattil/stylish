import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    super.key,
    required this.text,
    required this.iconData,
    this.color = Colorconstants.white,
  });
  final String text;
  final Color? color;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(spacing: 4, children: [Text(text), Icon(iconData)]),
    );
  }
}
