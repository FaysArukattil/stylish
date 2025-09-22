import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/view/checkout_screen/checkoutscreen.dart';
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
  int curentIndex = 0;

  // ✅ Properly typed list of screens
  final List<Widget> screens = [
    const HomeScreen(),
    const Wishlistscreen(),
    const Searchscreen(),
    const Settingscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(index: curentIndex, children: screens),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Checkoutscreen(cartItems: []),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curentIndex,
        selectedItemColor: Colorconstants.primary, // ✅ Highlight color
        unselectedItemColor: Colors.grey, // Optional: grey for unselected
        onTap: (value) => setState(() => curentIndex = value),
        type: BottomNavigationBarType.fixed,
        items: const [
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
