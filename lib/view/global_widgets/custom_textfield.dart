import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hint,
    required this.icon,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.bottompadding = 31,
    required this.obscureText,
    this.formKey,
  });

  final String hint;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final double bottompadding;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottompadding),
      child: Form(
        key: formKey,
        child: TextFormField(
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffA8A8A9)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffA8A8A9)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            prefixIcon: Icon(icon, size: 24, color: const Color(0xff626262)),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
