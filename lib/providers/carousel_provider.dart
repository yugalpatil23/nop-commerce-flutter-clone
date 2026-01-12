import 'package:flutter_riverpod/legacy.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

class CarouselState {
  final bool isLoading;
  final List<ProductModel> products;
  final int currentIndex;

  CarouselState({
    this.isLoading = false,
    this.products = const [],
    this.currentIndex = 0,
  });

  CarouselState copyWith({
    bool? isLoading,
    List<ProductModel>? products,
    int? currentIndex,
  }) {
    return CarouselState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

final carouselProvider = StateNotifierProvider<CarouselNotifier, CarouselState>(
  (ref) {
    return CarouselNotifier(ProductService());
  },
);

class CarouselNotifier extends StateNotifier<CarouselState> {
  final ProductService _productService;

  CarouselNotifier(this._productService) : super(CarouselState()) {
    getCarousels();
  }

  Future<void> getCarousels() async {
    state = state.copyWith(isLoading: true);
    final products = await _productService.getCarousel();
    state = state.copyWith(
      isLoading: false,
      products: products,
      currentIndex: 0, // reset on reload
    );
  }

  void setCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
