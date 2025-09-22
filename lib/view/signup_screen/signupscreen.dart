import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/view/global_widgets/custom_elevatedbutton.dart';
import 'package:stylish/view/global_widgets/custom_textfield.dart';
import 'package:stylish/view/global_widgets/socialbutton.dart';
import 'package:stylish/view/signin_screen/signinscreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SigninscrupSignupscreen();
}

class _SigninscrupSignupscreen extends State<Signupscreen> {
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
                  "Create An \n account!",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 36),
                CustomTextfield(
                  hint: "User Name or Email",
                  icon: Icons.person,
                  obscureText: false,
                ),
                CustomTextfield(
                  hint: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility),
                ),
                CustomTextfield(
                  hint: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility),
                  bottompadding: 19,
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "By clicking the ",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        style: TextStyle(fontSize: 12),
                        text: " button you agree\nto the public offer",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 38),
                CustomElevatedButton(text: "Created Account", onPressed: () {}),
                SizedBox(height: 40),

                Align(
                  alignment: Alignment.center,
                  child: Text("-OR continue with-"),
                ),
                SizedBox(height: 21),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        imagePath: Imageconstants.googlelogo,
                        onTap: () {},
                      ),
                      SizedBox(width: 10),
                      SocialButton(
                        imagePath: Imageconstants.applelogo,
                        onTap: () {},
                      ),
                      SizedBox(width: 10),

                      SocialButton(
                        imagePath: Imageconstants.facebooklogo,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "I Already have an Account ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Signinscreen()),
                        );
                      },
                      child: Text(
                        " Login",
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
