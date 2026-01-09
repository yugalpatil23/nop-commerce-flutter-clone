import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/routes/app_routes.dart';
import 'package:flutter_application_2/utils/app_constants.dart';
import 'package:flutter_application_2/widgets/app_elevated_button.dart';
import 'package:flutter_application_2/widgets/star_rating.dart';
import 'package:go_router/go_router.dart';

class FeaturedProductCard extends StatelessWidget {
  final ProductModel product;

  const FeaturedProductCard({super.key, required this.product});

  int get discountPercent {
    if (product.oldPrice == null) return 0;
    return (((product.oldPrice! - product.price) / product.oldPrice!) * 100)
        .round();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          context.push("${Routes.productDetailsNamedScreen}/55");
          // context.go(Routes.cartNamedScreen + Routes.productDetailsNamedScreen);
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Image + Discount Badge
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  if (product.oldPrice != null)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "-$discountPercent%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 Product Name
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),

                    /// 🔹 Category
                    Text(
                      product.category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 6),

                    /// 🔹 Rating
                    Row(
                      children: [
                        StarRating(rating: product.rating),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// 🔹 Price Section
                    Row(
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (product.oldPrice != null)
                          Text(
                            "\$${product.oldPrice}",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// 🔹 Add to Cart Button
                    ///
                    SizedBox(
                      height: 35,
                      child: AppElevatedButton(
                        btnTitle: "Add to Cart",
                        onPressed: () {
                          print("Added ${product.name} to cart");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
