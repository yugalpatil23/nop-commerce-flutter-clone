import 'package:flutter/material.dart';

class AppCircularprogressIndicator extends StatelessWidget {
  const AppCircularprogressIndicator({
    super.key,
    this.loadingIndicatorSize = 25,
  });

  final double loadingIndicatorSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: loadingIndicatorSize,
      width: loadingIndicatorSize,
      child: const CircularProgressIndicator(),
    );
  }
}
