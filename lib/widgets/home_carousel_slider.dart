import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../providers/carousel_provider.dart';
import '../utils/app_colors.dart';
import 'app_circularprogress_indicator.dart';

class HomeCarouselSlider extends ConsumerWidget {
  const HomeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carouselProducts = ref.watch(carouselProvider);
    final carouselNotifier = ref.read(carouselProvider.notifier);

    return Stack(
      alignment: AlignmentGeometry.center,
      children: carouselProducts.isLoading
          ? [Center(child: AppCircularprogressIndicator())]
          : [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    carouselNotifier.setCurrentIndex(index);
                  },
                ),
                items: carouselProducts.products.map((item) {
                  return InkWell(
                    onTap: () {
                      log("Image Tapped");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: Image.network(
                        item.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                }).toList(),
              ),

              Positioned(
                bottom: 10,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(carouselProducts.products.length, (
                    index,
                  ) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      // width: _currentIndex == index ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: carouselProducts.currentIndex == index
                            ? AppColors.primaryColor
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    );
                  }),
                ),
              ),
            ],
    );
  }
}
