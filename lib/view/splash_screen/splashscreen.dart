import 'package:flutter/material.dart';
import 'package:stylish/core/constants/imageconstants.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 9,
          children: [
            Image.asset(Imageconstants.appLogo, height: 125.01, width: 100),
            Text(
              "Stylish",
              style: TextStyle(
                fontSize: 40,
                color: Color(0xffF83758),

                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
