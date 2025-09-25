import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/view/global_widgets/custom_elevatedbutton.dart';
import 'package:stylish/view/global_widgets/custom_textfield.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(Imageconstants.profilelogo),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(Imageconstants.editBg),
                      child: Image.asset(
                        Imageconstants.editIcon,
                        height: 16,
                        width: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Personal Details
            _sectionTitle("Personal Details"),
            const SizedBox(height: 16),
            _label("Email Address"),
            CustomTextfield(hint: "example@email.com", obscureText: false),
            const SizedBox(height: 16),
            _label("Password"),
            CustomTextfield(hint: "********", obscureText: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Change Password",
                  style: TextStyle(color: Colorconstants.primary),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Business Address Details
            _sectionTitle("Business Address Details"),
            const SizedBox(height: 16),
            _label("Pincode"),
            CustomTextfield(hint: "430016", obscureText: false),
            const SizedBox(height: 16),
            _label("Address"),
            CustomTextfield(hint: "216 St Paul's Rd,", obscureText: false),
            const SizedBox(height: 16),
            _label("City"),
            CustomTextfield(hint: "London", obscureText: false),
            const SizedBox(height: 16),
            _label("State"),
            CustomTextfield(hint: "NW1 2LL", obscureText: false),
            const SizedBox(height: 16),
            _label("Country"),
            CustomTextfield(hint: "United Kingdom", obscureText: false),

            const SizedBox(height: 20),

            // Bank Account Details
            _sectionTitle("Bank Account Details"),
            const SizedBox(height: 16),
            _label("Bank Account Number"),
            CustomTextfield(hint: "204358XXXXXXX", obscureText: false),
            const SizedBox(height: 16),
            _label("Account Holder’s Name"),
            CustomTextfield(hint: "Abhinay Sisodya", obscureText: false),
            const SizedBox(height: 16),
            _label("IFSC Code"),
            CustomTextfield(hint: "SBIN0042B", obscureText: false),

            const SizedBox(height: 28),

            // Save Button
            CustomElevatedButton(
              text: "Save",
              onpressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
}
