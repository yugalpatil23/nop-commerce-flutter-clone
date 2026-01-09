import 'package:flutter/material.dart';
import 'package:flutter_application_2/l10n/app_localizations.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/widgets/featured_product_card.dart';

class HomeFeaturedProducts extends StatefulWidget {
  const HomeFeaturedProducts({super.key});

  @override
  State<HomeFeaturedProducts> createState() => _HomeFeaturedProductsState();
}

class _HomeFeaturedProductsState extends State<HomeFeaturedProducts> {
  final List<ProductModel> featuredProducts = [
    ProductModel(
      name: "Wireless Headphones",
      category: "Electronics",
      imageUrl: "https://picsum.photos/400/400",
      rating: 4.5,
      price: 79,
      oldPrice: 99,
    ),
    ProductModel(
      name: "Running Shoes",
      category: "Fashion",
      imageUrl: "https://picsum.photos/400/401",
      rating: 4.2,
      price: 59,
    ),
    ProductModel(
      name: "Smart Watch Pro",
      category: "Electronics",
      imageUrl: "https://picsum.photos/400/402",
      rating: 4.6,
      price: 129,
      oldPrice: 179,
    ),
    ProductModel(
      name: "Bluetooth Speaker",
      category: "Electronics",
      imageUrl: "https://picsum.photos/400/403",
      rating: 4.4,
      price: 49,
      oldPrice: 69,
    ),
    ProductModel(
      name: "Leather Backpack",
      category: "Accessories",
      imageUrl: "https://picsum.photos/400/404",
      rating: 4.3,
      price: 89,
    ),
    ProductModel(
      name: "Men’s Casual Jacket",
      category: "Fashion",
      imageUrl: "https://picsum.photos/400/405",
      rating: 4.1,
      price: 74,
      oldPrice: 99,
    ),
    ProductModel(
      name: "Gaming Mouse RGB",
      category: "Gaming",
      imageUrl: "https://picsum.photos/400/406",
      rating: 4.7,
      price: 39,
      oldPrice: 59,
    ),
    ProductModel(
      name: "Mechanical Keyboard",
      category: "Gaming",
      imageUrl: "https://picsum.photos/400/407",
      rating: 4.8,
      price: 109,
    ),
    ProductModel(
      name: "Coffee Maker",
      category: "Home Appliances",
      imageUrl: "https://picsum.photos/400/408",
      rating: 4.2,
      price: 99,
      oldPrice: 129,
    ),
    ProductModel(
      name: "Air Fryer XL",
      category: "Home Appliances",
      imageUrl: "https://picsum.photos/400/409",
      rating: 4.6,
      price: 149,
      oldPrice: 199,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            l10n.featured_products,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 350,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemCount: featuredProducts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: FeaturedProductCard(product: featuredProducts[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
