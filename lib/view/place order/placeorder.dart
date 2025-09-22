import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/core/cart/cartmanager.dart';
import 'package:stylish/view/global_widgets/custom_elevatedbutton.dart';

class Placeorder extends StatelessWidget {
  const Placeorder({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = CartManager.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Bag"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cart Items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                final double price =
                    double.tryParse(
                      item['price'].toString().replaceAll(
                        RegExp(r'[^0-9]'),
                        '',
                      ),
                    ) ??
                    0;

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          item['image'],
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "₹${price.toStringAsFixed(0)}",
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Show synced size
                            Text(
                              "Size: ${item['size']} | Qty: ${item['quantity']}",
                              style: GoogleFonts.montserrat(fontSize: 13),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Delivery by 10 May 20XX",
                              style: GoogleFonts.montserrat(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 10),

            // Apply Coupon
            ListTile(
              leading: const Icon(Icons.local_offer_outlined),
              title: const Text("Apply Coupons"),
              trailing: const Text(
                "Select",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Coupon flow coming soon...")),
                );
              },
            ),

            const Divider(),

            // Payment Details
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _paymentRow(
                    "Order Amounts",
                    "₹${CartManager.getTotalAmount().toStringAsFixed(2)}",
                  ),
                  const SizedBox(height: 8),
                  _paymentRow(
                    "Convenience",
                    "Know More",
                    action: () => _showConvenienceInfo(context),
                  ),
                  const SizedBox(height: 8),
                  _paymentRow("Delivery Fee", "Free", valueColor: Colors.green),
                  const Divider(height: 24),
                  _paymentRow(
                    "Order Total",
                    "₹${CartManager.getTotalAmount().toStringAsFixed(2)}",
                    bold: true,
                  ),
                  const SizedBox(height: 8),
                  _paymentRow(
                    "EMI Available",
                    "Details",
                    valueColor: Colors.red,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bottom Bar
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "₹${CartManager.getTotalAmount().toStringAsFixed(2)}",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: "Proceed to Payment",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Proceeding to Payment..."),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentRow(
    String label,
    String value, {
    bool bold = false,
    Color valueColor = Colors.black,
    VoidCallback? action,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: bold ? FontWeight.bold : null,
          ),
        ),
        GestureDetector(
          onTap: action,
          child: Text(
            value,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: bold ? FontWeight.bold : null,
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }

  void _showConvenienceInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(16),
        child: Text(
          "Convenience Fee is a small charge to cover payment handling & processing.",
          style: GoogleFonts.montserrat(fontSize: 14),
        ),
      ),
    );
  }
}
