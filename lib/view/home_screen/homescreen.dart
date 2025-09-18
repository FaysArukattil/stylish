// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/model/home_screen_model/category_model.dart';
import 'package:stylish/view/global_widgets/filtercard.dart';
import 'package:stylish/view/home_screen/widgets/categorywidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.scaffoldbg,
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: CircleAvatar(
            backgroundColor: Colorconstants.white,
            radius: 16,
            child: Icon(Icons.menu, size: 18),
          ),
        ),
        title: Row(
          spacing: 9,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Imageconstants.appLogo, height: 30),
            Text(
              'Stylish',
              style: GoogleFonts.libreCaslonText(
                color: Colorconstants.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(Imageconstants.profilelogo),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          //1----SEARCH SECTION
          _buildSearchSection(),

          // category and filter section
          _buildCategoryAndFilterSection(),

          //Carousel
          _buildCarouselSection(),
        ],
      ),
    );
  }

  Widget _buildCarouselSection() {
    List<String> imageurl = [
      Imageconstants.carouselimage1,
      Imageconstants.carouselimage1,
      Imageconstants.carouselimage1,
    ];

    return Column(
      children: [
        CarouselSlider(
          items: List.generate(
            imageurl.length,
            (index) => Container(
              width: 343,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imageurl[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          options: CarouselOptions(
            height: 189,
            // aspectRatio: 16/9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              currentIndex = index;
              setState(() {});
              print(index);
              print(reason.name);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: imageurl.length,
          effect: JumpingDotEffect(dotWidth: 9, dotHeight: 9),
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: "Search any Product..",
          hintStyle: TextStyle(color: Colorconstants.grey1),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic_none_rounded, color: Colorconstants.grey1),
          ),
          prefixIcon: Icon(Icons.search, color: Colorconstants.grey1),
        ),
      ),
    );
  }

  Widget _buildCategoryAndFilterSection() {
    List<CategoryModel> categoryList = [
      CategoryModel(imageurl: "assets/images/Beauty.png", categories: "Beauty"),
      CategoryModel(
        imageurl: "assets/images/fashion.png",
        categories: "Fashion",
      ),
      CategoryModel(imageurl: "assets/images/kids.png", categories: "kids"),
      CategoryModel(imageurl: "assets/images/Mens.png", categories: "Mens"),
      CategoryModel(imageurl: "assets/images/Womens.png", categories: "Womens"),
      CategoryModel(
        imageurl: "assets/images/fashion.png",
        categories: "Jackets",
      ),
    ];

    return Column(
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Row(
            children: [
              Text(
                "All Featured",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              FilterCard(text: "Sort", iconData: Icons.swap_vert),
              SizedBox(width: 20),
              FilterCard(text: "Filter", iconData: Icons.filter_alt_outlined),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              spacing: 16,
              children: List.generate(
                categoryList.length,
                (index) => CategoryWidget(
                  imgePath: categoryList[index].imageurl,
                  category: categoryList[index].categories,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
