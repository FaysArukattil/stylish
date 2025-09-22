import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/core/cart/cartmanager.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/view/global_widgets/filtercard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/view/checkout_screen/checkoutscreen.dart';

class ShopPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ShopPage({super.key, required this.product});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int currentPageIndex = 0;
  int selectedSizeIndex = 0;
  final List<String> sizes = ["6 UK", "7 UK", "8 UK", "9 UK", "10 UK"];
  late PageController _pageController;

  // UK to Display Size Mapping
  final Map<String, String> ukToSizeMap = {
    "6 UK": "Small",
    "7 UK": "Medium",
    "8 UK": "Large",
    "9 UK": "XL",
    "10 UK": "XXL",
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final double rating = (product["rating"] ?? 0).toDouble();
    final String title = product["title"] ?? "Product";
    final String price = product["price"] ?? "₹0";
    final String oldPrice = product["oldPrice"] ?? "";
    final String discount = product["discount"] ?? "";
    final String description =
        product["description"] ?? "No description available.";

    final List<String> productImages =
        product["images"] ??
        [product["image"], product["image"], product["image"]];

    return Scaffold(
      backgroundColor: Colorconstants.scaffoldbg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel with page indicator & next button
            SizedBox(
              height: 260,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: productImages.length,
                    onPageChanged: (index) {
                      setState(() => currentPageIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(16),
                        ),
                        child: Image.asset(
                          productImages[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),
                  // Next button
                  Positioned(
                    right: 12,
                    top: 100,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (currentPageIndex < productImages.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  // Page indicator
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: productImages.length,
                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.white,
                          dotColor: Colors.white54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Size Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Select Size",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Wrap(
                spacing: 10,
                children: List.generate(sizes.length, (index) {
                  return ChoiceChip(
                    label: Text(sizes[index]),
                    selected: selectedSizeIndex == index,
                    onSelected: (selected) {
                      setState(() {
                        selectedSizeIndex = index;

                        // Update CartManager size if item already exists
                        final productId =
                            "${widget.product['id'] ?? widget.product['title']}_${ukToSizeMap[sizes[index]]}";
                        final existingItem = CartManager.cartItems.firstWhere(
                          (item) =>
                              item['title'] == widget.product['title'] &&
                              item['id'] != productId,
                          orElse: () => {},
                        );

                        if (existingItem.isNotEmpty) {
                          CartManager.updateSize(
                            existingItem['id'],
                            ukToSizeMap[sizes[index]]!,
                          );
                        }
                      });
                    },
                    selectedColor: Colorconstants.primary,
                    labelStyle: GoogleFonts.montserrat(
                      color: selectedSizeIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 16),

            // Title, Price, Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colorconstants.primary,
                        ),
                      ),
                      if (oldPrice.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Text(
                          oldPrice,
                          style: GoogleFonts.montserrat(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                      if (discount.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Text(
                          discount,
                          style: GoogleFonts.montserrat(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: rating,
                        itemBuilder: (context, index) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        rating.toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Product Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Product Details",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // View Similar & Add to Compare
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colorconstants.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .05),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.visibility_outlined, size: 22),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "View Similar",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colorconstants.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .05),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.compare_arrows_outlined, size: 22),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "Add to Compare",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Add to Cart & Buy Now Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  // Add to Cart
                  Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              CartManager.addToCart(
                                widget.product,
                                size: ukToSizeMap[sizes[selectedSizeIndex]],
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Item added to cart"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                "Add to Cart",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: -20,
                            top: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.blue.shade100,
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Buy Now
                  Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              CartManager.addToCart(
                                widget.product,
                                size: ukToSizeMap[sizes[selectedSizeIndex]],
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Checkoutscreen(
                                    cartItems: CartManager.cartItems,
                                  ),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: -20,
                            top: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.green.shade100,
                              child: Icon(Icons.payment, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Similar Products Grid & Filter Section (UNCHANGED)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
                children: [
                  Text(
                    "Similar to\n289+ Items",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  FilterCard(text: "Sort", iconData: Icons.swap_vert),
                  const SizedBox(width: 20),
                  FilterCard(
                    text: "Filter",
                    iconData: Icons.filter_alt_outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
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
                        child: Image.asset(
                          productImages[0],
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          price,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            color: Colorconstants.primary,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
