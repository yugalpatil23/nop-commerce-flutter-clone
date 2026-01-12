import 'package:flutter/material.dart';

import '../../widgets/home_carousel_slider.dart';
import '../../widgets/home_featured_products.dart';
import '../../widgets/home_popular_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeCarouselSlider(),
              SizedBox(height: 20),
              HomePopularCategories(),
              SizedBox(height: 20),
              HomeFeaturedProducts(),
              // ElevatedButton(
              //   onPressed: () {
              //     // Action to perform when the button is pressed
              //     print('Button pressed!');
              //     // context.go(Routes.homeDetailsNamedPage);
              //     // context.go(
              //     //   '${Routes.settingsNamedPage}/${Routes.profileDetailsNamedPage}',
              //     // );
              //   },
              //   child: const Text('Go To Home Details'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
