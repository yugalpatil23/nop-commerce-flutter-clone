import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.btnTitle,
    required this.onPressed,
    this.isLoading = false,
    this.showLoading = true,
    this.borderRadius = 100,
    this.height = 48,
    this.loadingIndicatorSize = 25,
  });

  final String btnTitle;
  final Function onPressed;
  final bool isLoading;
  final bool showLoading;
  final double borderRadius;
  final double height;
  final double loadingIndicatorSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: !showLoading
            ? () => onPressed()
            : isLoading
            ? null
            : () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading && showLoading
            ? SizedBox(
                height: loadingIndicatorSize,
                width: loadingIndicatorSize,
                child: const CircularProgressIndicator(),
              )
            : Text(btnTitle),
      ),
    );
  }
}
