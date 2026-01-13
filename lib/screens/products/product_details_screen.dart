import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/app_elevated_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<String> images = [
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
    "https://picsum.photos/200/300",
  ];

  int selectedImage = 0;
  int quantity = 1;
  bool isWishlisted = false;

  String selectedColor = "Red";
  String selectedSize = "M";

  double basePrice = 999;
  double finalPrice = 999;

  final Map<String, double> sizePrice = {"S": 0, "M": 100, "L": 200};

  void updatePrice() {
    setState(() {
      finalPrice = basePrice + sizePrice[selectedSize]!;
    });
  }

  void shareProduct() {
    Share.share("Check out this product! Price: ₹$finalPrice");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: shareProduct),
        ],
      ),
      body: Column(
        children: [
          /// IMAGE SLIDER WITH ZOOM
          SizedBox(
            height: 300,
            child: PhotoViewGallery.builder(
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() => selectedImage = index);
              },
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE + WISHLIST
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Stylish T-Shirt",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isWishlisted ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            isWishlisted = !isWishlisted;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// PRICE
                  Text(
                    "₹$finalPrice",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// COLOR SELECTION
                  const Text("Select Color"),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    children: ["Red", "Blue", "Black"].map((color) {
                      return ChoiceChip(
                        label: Text(color),
                        selected: selectedColor == color,
                        onSelected: (_) {
                          setState(() => selectedColor = color);
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  /// SIZE SELECTION
                  const Text("Select Size"),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    children: ["S", "M", "L"].map((size) {
                      return ChoiceChip(
                        label: Text(size),
                        selected: selectedSize == size,
                        onSelected: (_) {
                          setState(() {
                            selectedSize = size;
                            updatePrice();
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  /// QUANTITY
                  Row(
                    children: [
                      const Text("Quantity"),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: quantity > 1
                            ? () => setState(() => quantity--)
                            : null,
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => setState(() => quantity++),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// DESCRIPTION
                  const Text(
                    "Product Description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "This is a high-quality stylish t-shirt made with premium fabric. Comfortable for daily wear and available in multiple sizes and colors.",
                  ),
                  const Text(
                    "This is a high-quality stylish t-shirt made with premium fabric. Comfortable for daily wear and available in multiple sizes and colors.",
                  ),
                  const Text(
                    "This is a high-quality stylish t-shirt made with premium fabric. Comfortable for daily wear and available in multiple sizes and colors.",
                  ),
                ],
              ),
            ),
          ),

          /// ADD TO CART BUTTON
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: AppElevatedButton(
                btnTitle: "Add to Cart",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
