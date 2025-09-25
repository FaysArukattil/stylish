import 'package:flutter/material.dart';
import 'package:stylish/view/orders_screen/myorderscreen.dart';
import 'package:stylish/view/profile_screen/profilescreen.dart';
import 'package:stylish/view/wishlist_screen/wishlistscreen.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> settingsOptions = [
      {
        "icon": Icons.person,
        "title": "Profile",
        "onTap": () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profilescreen()),
          );
        },
      },
      {
        "icon": Icons.shopping_bag,
        "title": "My Orders",
        "onTap": () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
          );
        },
      },
      {
        "icon": Icons.favorite,
        "title": "Wishlist",
        "onTap": () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wishlistscreen()),
          );
        },
      },
      {"icon": Icons.settings, "title": "App Settings", "onTap": () {}},
      {"icon": Icons.logout, "title": "Logout", "onTap": () {}},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: ListView.separated(
        itemCount: settingsOptions.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey[300]),
        itemBuilder: (context, index) {
          final item = settingsOptions[index];
          return ListTile(
            leading: Icon(item["icon"], color: Colors.pink),
            title: Text(
              item["title"],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => item["onTap"](),
          );
        },
      ),
    );
  }
}
