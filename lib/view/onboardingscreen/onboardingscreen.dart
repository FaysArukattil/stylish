import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/view/home_screen/homescreen.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  List data = [
    {
      "image": Imageconstants.onboarding1,
      "title": "Choose Products",
      "desc": "Explore a wide range of quality items and pick what you love.",
    },
    {
      "image": Imageconstants.onboarding2,
      "title": "Make Payment",
      "desc": "Secure and seamless payment options for a smooth checkout.",
    },
    {
      "image": Imageconstants.onboarding3,
      "title": "Get Your Order",
      "desc": "Sit back and relax while we deliver right to your doorstep.",
    },
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              text: "${index + 1}",
              children: [
                TextSpan(
                  text: "/3",
                  style: TextStyle(color: Colorconstants.grey),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text("skip"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homescreen()),
              );
            },
          ),
          SizedBox(width: 14),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(data[index]['image'], height: 300, width: 300),
            Text(
              data[index]['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colorconstants.grey),
                data[index]['desc'],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                if (index > 0) {
                  index--;
                  setState(() {});
                }
              },
              child: Text(
                index == 0 ? " " : "prev",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              child: Text(
                index == data.length - 1 ? "Get Started" : "Next",
                style: TextStyle(color: Colorconstants.primary, fontSize: 18),
              ),
              onPressed: () {
                if (index < data.length - 1) {
                  index++;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
