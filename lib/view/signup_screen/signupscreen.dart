import 'package:flutter/material.dart';
import 'package:stylish/core/constants/colorconstants.dart';
import 'package:stylish/core/constants/imageconstants.dart';
import 'package:stylish/view/get_started_screen/getstartedscreen.dart';
import 'package:stylish/view/global_widgets/custom_elevatedbutton.dart';
import 'package:stylish/view/global_widgets/custom_textfield.dart';
import 'package:stylish/view/global_widgets/socialbutton.dart';
import 'package:stylish/view/signin_screen/signinscreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  // Individual form keys like SignIn screen
  final usernameFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final confirmPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
                const Text(
                  "Create An \n account!",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 36),

                // Username / Email
                CustomTextfield(
                  formKey: usernameFormKey,
                  hint: "Username or Email",
                  icon: Icons.person,
                  obscureText: false,
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter username or email";
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,15}$');

                    if (emailRegex.hasMatch(value.trim()) ||
                        usernameRegex.hasMatch(value.trim())) {
                      return null;
                    }
                    return "Enter a valid email or username (3-15 chars)";
                  },
                ),

                // Password
                CustomTextfield(
                  formKey: passwordFormKey,
                  hint: "Password",
                  icon: Icons.lock,
                  obscureText: _obscurePassword,
                  controller: _passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter password";
                    }
                    final passwordRegex = RegExp(
                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{6,}$',
                    );
                    if (!passwordRegex.hasMatch(value.trim())) {
                      return "Password must be 6+ chars, include letter, number & special char";
                    }
                    return null;
                  },
                ),

                // Confirm Password
                CustomTextfield(
                  formKey: confirmPasswordFormKey,
                  hint: "Confirm Password",
                  icon: Icons.lock,
                  obscureText: _obscureConfirmPassword,
                  controller: _confirmPasswordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  bottompadding: 19,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please confirm password";
                    }
                    if (value != _passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: "By clicking the ",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        style: TextStyle(fontSize: 12),
                        text: " button you agree\nto the public offer",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 38),

                CustomElevatedButton(
                  text: "Create Account",
                  onpressed: () {
                    final isUserValid =
                        usernameFormKey.currentState?.validate() ?? false;
                    final isPassValid =
                        passwordFormKey.currentState?.validate() ?? false;
                    final isConfirmPassValid =
                        confirmPasswordFormKey.currentState?.validate() ??
                        false;

                    if (isUserValid && isPassValid && isConfirmPassValid) {
                      const snackBar = SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("Account created successfully!"),
                        behavior: SnackBarBehavior.floating,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // Delay navigation until SnackBar disappears
                      Future.delayed(snackBar.duration, () {
                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => Getstartedscreen(),
                          ),
                        );
                      });
                    }
                  },
                ),

                const SizedBox(height: 40),
                const Align(
                  alignment: Alignment.center,
                  child: Text("-OR continue with-"),
                ),
                const SizedBox(height: 21),

                Center(
                  child: Row(
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
                ),
                const SizedBox(height: 28),
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
                          MaterialPageRoute(
                            builder: (_) => const Signinscreen(),
                          ),
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
