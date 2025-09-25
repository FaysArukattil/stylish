import 'package:flutter/material.dart';
import 'package:stylish/view/bottom_navbar_screen/bottomnavbarscreen.dart';
import 'package:stylish/view/global_widgets/custom_elevatedbutton.dart';
import 'package:stylish/core/cart/cartmanager.dart';
import 'package:stylish/core/orders/ordermanager.dart';

class Paymentscreen extends StatefulWidget {
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  int selectedMethod = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {"icon": "💳", "title": "VISA", "number": "********2109"},
    {"icon": "💲", "title": "PayPal", "number": "********2109"},
    {"icon": "🏦", "title": "MasterCard", "number": "********2109"},
    {"icon": "🍏", "title": "Apple Pay", "number": "********2109"},
  ];

  void handlePayment() async {
    final total = CartManager.getTotalAmount();
    final shipping = 30.0;
    final grandTotal = total + shipping;

    // Save order BEFORE clearing cart
    OrderManager.addOrder(
      CartManager.cartItems,
      grandTotal,
      paymentMethods[selectedMethod]['title'],
    );

    // Clear cart
    CartManager.clearCart();

    // Show success popup
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.check_circle, color: Colors.pink, size: 80),
              SizedBox(height: 15),
              Text(
                "Payment done successfully.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );

    // Wait then redirect
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pop(context); // close dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottomnavbarscreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = CartManager.getTotalAmount();
    const shipping = 30.0;
    final grandTotal = total + shipping;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Order", style: TextStyle(fontSize: 16)),
                Text("₹$total", style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Shipping", style: TextStyle(fontSize: 16)),
                Text("₹30", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹$grandTotal",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            const Text(
              "Payment",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),

            // Payment Options
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedMethod == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMethod = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.grey.shade300,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                paymentMethods[index]["icon"],
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                paymentMethods[index]["title"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            paymentMethods[index]["number"],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Continue Button
            CustomElevatedButton(text: "Continue", onpressed: handlePayment),
          ],
        ),
      ),
    );
  }
}
