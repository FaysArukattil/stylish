import 'package:flutter/material.dart';
import 'package:stylish/view/home_screen/homescreen.dart';
import 'package:stylish/view/search_screen/searchscreen.dart';
import 'package:stylish/view/settings_screen/settingscreen.dart';
import 'package:stylish/view/wishlist_screen/wishlistscreen.dart';

class Bottomnavbarscreen extends StatefulWidget {
  const Bottomnavbarscreen({super.key});

  @override
  State<Bottomnavbarscreen> createState() => _BottomnavbarscreenState();
}

class _BottomnavbarscreenState extends State<Bottomnavbarscreen> {
  List screens = [
    Homescreen(),
    Wishlistscreen(),
    Searchscreen(),
    Settingscreen(),
  ];
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[curentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        child: Icon(Icons.shopping_cart_outlined),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          curentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'wishlist',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
