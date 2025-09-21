import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/model/home_screen_model/category_model.dart';
import 'package:stylish/view/global_widgets/filtercard.dart';
import 'package:stylish/view/home_screen/widgets/categorywidget.dart';
import 'package:stylish/view/profile_screen/profilescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List dummyData = [
    {
      "imagepath": Imageconstants.shoes,
      "title": "HRX by Hrithik Roshan",
      "desc": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "2499",
      "mrp": "4999",
      "offer": "50% OFF",
      "offerPercent": "50",
      "saving": "₹2500",
    },
    {
      "imagepath": Imageconstants.kurta,
      "title": "Women Printed Kurtha",
      "desc": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "1500",
      "mrp": "2499",
      "offer": "40% OFF",
      "offerPercent": 40,
      "saving": "₹999",
    },
    {
      "imagepath": Imageconstants.watch,
      "title": "IWC Schaffhausen 2025 Pilot's Watch 44mm",
      "desc": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "650",
      "mrp": "1599",
      "offer": "60% OFF",
      "offerPercent": 60,
      "saving": "₹949",
    },
    {
      "imagepath": Imageconstants.whiteshoe,
      "title": "Labbin White Sneakers for Men and Women",
      "desc": "Neque porro quisquam est qui dolorem ipsum quia",
      "price": "650",
      "mrp": "1250",
      "offer": "70% OFF",
      "offerPercent": 70,
      "saving": "₹999",
    },
  ];

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
            child: const Icon(Icons.menu, size: 18),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Image.asset(Imageconstants.appLogo, height: 30)),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Stylish',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.libreCaslonText(
                  color: Colorconstants.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profilescreen()),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(Imageconstants.profilelogo),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Section
            _buildSearchSection(),

            // Category & Filter Section
            _buildCategoryAndFilterSection(),

            // Carousel Section
            _buildCarouselSection(),
            SizedBox(height: 14),
            // Deal of the Day Section
            _buildDealofDayCard(
              title: 'Deal of The Day',
              subtitle: '22h 55m 20s remaining',
              color: Colorconstants.secondary,
              icon: Icons.access_time,
            ),

            //GRID VIEW
            SizedBox(height: 18),
            _buildGridView(),

            //Special Offer
            SizedBox(height: 18),
            _buildspecialoffer(),
            SizedBox(height: 16),
            _buildheelsvisit(),
            SizedBox(height: 16),
            _buildDealofDayCard(
              title: 'Trending Products',
              subtitle: 'Last Date 29/02/22',
              color: Colorconstants.primary,
              icon: Icons.calendar_month,
            ),
            SizedBox(height: 18),
            _buildGridView(),
            SizedBox(height: 16),
            _buildsummersale(),
            SizedBox(height: 16),
            _buildsponsoredsection(),
            SizedBox(height: 59),
          ],
        ),
      ),
    );
  }

  Container _buildsponsoredsection() {
    return Container(
      height: 330,
      width: 337,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Imageconstants.sponsored)),
      ),
    );
  }

  SizedBox _buildsummersale() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 343,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Imageconstants.summersale),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Arrivals", style: TextStyle(fontSize: 20)),
                      Text(
                        "Summer'25 Collections",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        Colorconstants.white,
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        Colorconstants.primary,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("View all"),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_right_alt),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildheelsvisit() {
    return Container(
      height: 172,
      width: 343,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(Imageconstants.heels)),
      ),
    );
  }

  Container _buildspecialoffer() {
    return Container(
      height: 84,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/specialoffer.png'),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    final ScrollController scrollController = ScrollController();

    return Stack(
      children: [
        // Horizontal scrollable product cards
        SizedBox(
          height: 250,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              final item = dummyData[index];

              return Container(
                width: 170,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Product Image + Offer Badge
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8),
                          ),
                          child: Image.asset(
                            item["imagepath"],
                            height: 124,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // ✅ Offer Badge
                        if (item["offer"] != null)
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                item["offer"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    // ✅ Product Info
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item["desc"],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                "₹${item["price"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "₹${item["mrp"]}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // Right scroll button → moves to next card
        Positioned(
          right: 8,
          top: 100,
          child: GestureDetector(
            onTap: () {
              final double nextOffset = scrollController.offset + 180;
              scrollController.jumpTo(
                nextOffset > scrollController.position.maxScrollExtent
                    ? scrollController.position.maxScrollExtent
                    : nextOffset,
              );
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildDealofDayCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 9),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colorconstants.white,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(icon, color: Colors.white, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colorconstants.white),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_right_alt, color: Colors.white, size: 18),
              ],
            ),
          ),
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
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              currentIndex = index;
              setState(() {});
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 12),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: imageurl.length,
          effect: const JumpingDotEffect(dotWidth: 9, dotHeight: 9),
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
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
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
              const Spacer(),
              FilterCard(text: "Sort", iconData: Icons.swap_vert),
              const SizedBox(width: 20),
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
        const SizedBox(height: 16),
      ],
    );
  }
}
