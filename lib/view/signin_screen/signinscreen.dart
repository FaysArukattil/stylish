import 'package:flutter/material.dart';
import 'package:stylish/view/global_widgets/custom_textfield.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
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
                "Welcome\n back!",
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
            ],
          ),
        ),
      ),
    );
  }
}
