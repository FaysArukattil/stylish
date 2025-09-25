import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/view/forgot_screen/forgotscreen.dart';
import 'package:stylish/view/get_started_screen/getstartedscreen.dart';
import 'package:stylish/view/global_widgets/custom_elevatedbutton.dart';
import 'package:stylish/view/global_widgets/custom_textfield.dart';
import 'package:stylish/view/global_widgets/socialbutton.dart';
import 'package:stylish/view/signup_screen/signupscreen.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final userNameFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 19),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome\n back!",
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 36),

                // Username / Email field
                CustomTextfield(
                  formKey: userNameFormKey,
                  hint: "User Name or Email",
                  icon: Icons.person,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter username or email";
                    }

                    // Email RegExp
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    // Username RegExp (min 3 chars, only letters/numbers/underscore)
                    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,}$');

                    if (emailRegex.hasMatch(value.trim()) ||
                        usernameRegex.hasMatch(value.trim())) {
                      return null;
                    }
                    return "Enter a valid email or username (min 3 chars)";
                  },
                ),

                // Password field
                CustomTextfield(
                  formKey: passFormKey,
                  hint: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility),
                  bottompadding: 9,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter password";
                    }

                    // Password RegExp: min 8, at least 1 uppercase, 1 lowercase, 1 digit, 1 special char
                    final passwordRegex = RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
                    );

                    if (passwordRegex.hasMatch(value.trim())) {
                      return null;
                    }
                    return "Password must be 8+ chars, include upper, lower, digit & special char";
                  },
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colorconstants.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 54),

                CustomElevatedButton(
                  text: "Login",
                  onpressed: () {
                    final isUserNameValid =
                        userNameFormKey.currentState?.validate() ?? false;
                    final isPasswordValid =
                        passFormKey.currentState?.validate() ?? false;

                    if (isUserNameValid && isPasswordValid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Getstartedscreen(),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 77),

                Align(
                  alignment: Alignment.center,
                  child: Text("-OR continue with-"),
                ),
                const SizedBox(height: 21),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      imagePath: Imageconstants.googlelogo,
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    SocialButton(
                      imagePath: Imageconstants.applelogo,
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),
                    SocialButton(
                      imagePath: Imageconstants.facebooklogo,
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Create an Account ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Signupscreen(),
                          ),
                        );
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colorconstants.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5,
                          decorationColor: Colorconstants.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
