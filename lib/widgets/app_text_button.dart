import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.alignment = Alignment.center,
  });

  final String title;
  final Function onPressed;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(onPressed: () => onPressed(), child: Text(title)),
    );
  }
}
