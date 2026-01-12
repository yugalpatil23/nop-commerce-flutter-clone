import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/app_elevated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border),
            SizedBox(height: 20),
            Text("Your wishlist is empty"),
            SizedBox(height: 20),

            SizedBox(
              width: 300,
              child: AppElevatedButton(
                btnTitle: "Refresh Wishlist",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
