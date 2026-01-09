import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.labelText,
    this.hintText,
    this.suffixIcon,
    this.validator,
    this.isRequired = false,
    this.keyboardType,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool isRequired;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
