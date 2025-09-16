import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Map<String, String>> stories = [
    {'text': "Beauty", 'image': Imageconstants.beauty},
    {'text': "Fashion", 'image': Imageconstants.fashion},
    {'text': "Kids", 'image': Imageconstants.kids},
    {'text': "Mens", 'image': Imageconstants.mens},
    {'text': "Womens", 'image': Imageconstants.women},
    {'text': "Beauty", 'image': Imageconstants.beauty},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ---------- TOP BAR ----------
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.menu, size: 28),
                    Row(
                      children: [
                        Image.asset(Imageconstants.appLogo, width: 34),
                        const SizedBox(width: 6),
                        Text(
                          "Stylish",
                          style: TextStyle(
                            color: Colorconstants.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: const AssetImage(
                        'assets/images/profileicon.png',
                      ),
                    ),
                  ],
                ),
              ),

              /// ---------- SEARCH BAR ----------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Product",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.mic_none, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// ---------- STORIES ----------
              SizedBox(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                stories[index]['image']!,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            stories[index]['text']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
