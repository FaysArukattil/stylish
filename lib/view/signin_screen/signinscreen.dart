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

                CustomTextfield(
                  formKey: userNameFormKey,
                  hint: "User Name or Email",
                  icon: Icons.person,
                  obscureText: false,
                  validator: (value) {
                    if (value != null && value.trim().length >= 3) {
                      return null;
                    }
                    return "Enter a valid username (min 3 characters)";
                  },
                ),

                CustomTextfield(
                  formKey: passFormKey,
                  hint: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility),
                  bottompadding: 9,
                  validator: (value) {
                    if (value != null && value.trim().length >= 7) {
                      return null;
                    }
                    return "Enter a valid password (min 7 characters)";
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
                  onTap: () {
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
                  onPressed: () {},
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
