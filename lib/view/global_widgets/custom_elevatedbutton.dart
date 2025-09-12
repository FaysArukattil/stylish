import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 51,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          backgroundColor: WidgetStatePropertyAll(Colorconstants.primary),
          foregroundColor: WidgetStatePropertyAll(Colorconstants.white),
        ),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
