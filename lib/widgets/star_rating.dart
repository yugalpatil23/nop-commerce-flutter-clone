import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int maxStars;
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.maxStars = 5,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(maxStars, (index) {
        if (index < rating.floor()) {
          // Full star
          return Icon(Icons.star, size: size, color: Colors.amber);
        } else if (index < rating) {
          // Half star
          return Icon(Icons.star_half, size: size, color: Colors.amber);
        } else {
          // Empty star
          return Icon(Icons.star_border, size: size, color: Colors.amber);
        }
      }),
    );
  }
}
