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
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        maxLines: keyboardType == TextInputType.multiline ? 5 : 1,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,

        decoration: InputDecoration(
          border: keyboardType == TextInputType.multiline
              ? OutlineInputBorder(borderRadius: BorderRadius.circular(30))
              : null,
          enabledBorder: keyboardType == TextInputType.multiline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                )
              : null,
          focusedBorder: keyboardType == TextInputType.multiline
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                )
              : null,
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
