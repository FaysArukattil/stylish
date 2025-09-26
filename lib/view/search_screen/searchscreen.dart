import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/view/global_widgets/filtercard.dart';
import 'package:stylish/view/profile_screen/profilescreen.dart';
import 'package:stylish/view/settings_screen/settingscreen.dart';
import 'package:stylish/view/shop_page/shop_page.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => SearchscreenState();
}

class SearchscreenState extends State<Searchscreen> {
  final List<Map<String, dynamic>> products = [
    {
      "image": Imageconstants.nike2,
      "title": "Nike Air Max",
      "price": "₹3,499",
      "rating": 4.6,
      "description":
          "Nike Air Max shoes combine comfort and style, perfect for daily wear and sports.",
    },
    {
      "image": Imageconstants.nike1,
      "title": "Nike Runner Shoes",
      "price": "₹2,899",
      "rating": 4.4,
      "description":
          "Nike Runner Shoes are lightweight and breathable, ideal for running and workouts.",
    },
    {
      "image": Imageconstants.formalshoes,
      "title": "Formal Leather Shoes",
      "price": "₹2,199",
      "rating": 4.3,
      "description":
          "Elegant formal leather shoes designed for office and special occasions.",
    },
    {
      "image": Imageconstants.blackjacket,
      "title": "Black Jacket",
      "price": "₹2,799",
      "rating": 4.5,
      "description":
          "Stylish black jacket made from premium materials to keep you warm and trendy.",
    },
    {
      "image": Imageconstants.jordan,
      "title": "Jordan Sneakers",
      "price": "₹4,499",
      "rating": 4.7,
      "description":
          "Jordan Sneakers provide excellent comfort and a sporty look for daily wear.",
    },
    {
      "image": Imageconstants.denimwomen,
      "title": "Women Denim Dress",
      "price": "₹1,899",
      "rating": 4.3,
      "description":
          "Comfortable and stylish denim dress for women, perfect for casual outings.",
    },
    {
      "image": Imageconstants.womenflaredress,
      "title": "Women Flare Dress",
      "price": "₹1,699",
      "rating": 4.6,
      "description":
          "Flare dress designed for elegance and comfort, ideal for parties and events.",
    },
    {
      "image": Imageconstants.rosepinkwomen,
      "title": "Rose Pink Women Top",
      "price": "₹1,299",
      "rating": 4.2,
      "description":
          "Trendy rose pink top for women, perfect for casual and semi-formal occasions.",
    },
    {
      "image": Imageconstants.blackwomensexy,
      "title": "Black Women Top",
      "price": "₹1,499",
      "rating": 4.4,
      "description": "Sleek black top designed for a chic and stylish look.",
    },
    {
      "image": Imageconstants.shirt,
      "title": "Casual Shirt",
      "price": "₹1,099",
      "rating": 4.0,
      "description":
          "Comfortable casual shirt suitable for daily wear and informal outings.",
    },
    {
      "image": Imageconstants.hoody,
      "title": "Hoodie",
      "price": "₹1,799",
      "rating": 4.5,
      "description":
          "Warm and cozy hoodie, perfect for chilly weather and casual looks.",
    },
  ];

  String searchQuery = '';
  List<Map<String, dynamic>> filteredProducts = [];

  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = products
          .where(
            (product) =>
                product["title"].toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayProducts = searchQuery.isEmpty
        ? []
        : filteredProducts; // show only on search

    return Scaffold(
      backgroundColor: Colorconstants.scaffoldbg,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchSection(),
            if (searchQuery.isNotEmpty) _buildCategoryAndFilterSection(),
            const SizedBox(height: 10),
            if (searchQuery.isNotEmpty && displayProducts.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MasonryGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: displayProducts.length,
                  itemBuilder: (context, index) {
                    final product = displayProducts[index];
                    return _buildProductCard(product);
                  },
                ),
              ),
            if (searchQuery.isNotEmpty && displayProducts.isEmpty)
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "No products found",
                  style: TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Center(
        child: CircleAvatar(
          backgroundColor: Colorconstants.white,
          radius: 16,
          child: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 18,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settingscreen()),
            ),
          ),
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
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: updateSearch, // <-- real-time search
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: [
          Text(
            "${filteredProducts.length}+ Items ",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          FilterCard(text: "Sort", iconData: Icons.swap_vert),
          const SizedBox(width: 10),
          FilterCard(text: "Filter", iconData: Icons.filter_alt_outlined),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    double rating = product["rating"];

    return InkWell(
      onTap: () {
        // Ensure images is a List<String>
        final List<String> imagesList = List<String>.from([product['image']]);

        final Map<String, dynamic> productMap = {
          "title": product['title'],
          "price": product['price'],
          "image": product['image'],
          "images": imagesList, // <-- fixed List<String> issue
          "rating": product['rating'],
          "description": product['description'],
          "oldPrice": "",
          "discount": "",
          "id": product['title'],
        };

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ShopPage(product: productMap, productData: null),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(product["image"], fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product["title"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product["price"],
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  color: Colorconstants.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(
                product["description"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) =>
                        const Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 20,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    rating.toString(),
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
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
}
