import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        splashColor: Colorconstants.primary.withValues(alpha: .2),
        child: Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colorconstants.primary, width: 1.8),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(10),
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
