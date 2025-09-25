import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/view/global_widgets/custom_elevatedbutton.dart';
import 'package:stylish/view/global_widgets/custom_textfield.dart';
import 'package:stylish/view/signin_screen/signinscreen.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => ForgotScreenState();
}

class ForgotScreenState extends State<ForgotScreen> {
  final emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot password?",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 36),

              // Email field with RegExp validation
              CustomTextfield(
                formKey: emailFormKey,
                hint: "Enter your email address",
                icon: Icons.email,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your email";
                  }

                  // Email RegExp
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (emailRegex.hasMatch(value.trim())) {
                    return null;
                  }
                  return "Enter a valid email address";
                },
              ),

              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "* ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colorconstants.primary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "We will send you a message to set or reset your new password",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              CustomElevatedButton(
                text: "Submit",
                onpressed: () {
                  final isEmailValid =
                      emailFormKey.currentState?.validate() ?? false;

                  if (isEmailValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signinscreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text("Password reset link sent to email"),
                        backgroundColor: Colorconstants.primary,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
