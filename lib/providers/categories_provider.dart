import 'package:flutter_riverpod/legacy.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class CategoriesState {
  final bool isLoading;
  final List<CategoryModel> popularCategories;

  CategoriesState({this.isLoading = false, this.popularCategories = const []});

  CategoriesState copyWith({
    bool? isLoading,
    List<CategoryModel>? popularCategories,
    int? currentIndex,
  }) {
    return CategoriesState(
      isLoading: isLoading ?? this.isLoading,
      popularCategories: popularCategories ?? this.popularCategories,
    );
  }
}

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>((ref) {
      return CategoriesNotifier(ProductService());
    });

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  final ProductService _productService;

  CategoriesNotifier(this._productService) : super(CategoriesState()) {
    getpopularCategories();
  }

  Future<void> getpopularCategories() async {
    state = state.copyWith(isLoading: true);
    final products = await _productService.getPopularCategories();
    state = state.copyWith(isLoading: false, popularCategories: products);
  }
}
