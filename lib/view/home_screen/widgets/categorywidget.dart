import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.imgePath,
    required this.category,
  });
  final String imgePath;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 28, backgroundImage: AssetImage(imgePath)),
        Text(category),
      ],
    );
  }
}
