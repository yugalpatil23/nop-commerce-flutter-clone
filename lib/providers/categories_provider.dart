import 'package:flutter_riverpod/legacy.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class CategoriesState {
  final bool isLoading;
  final List<CategoryModel> popularCategories;

  final bool isSubcategoriesLoading;
  final List<CategoryModel> subCategories;

  CategoriesState({
    this.isLoading = false,
    this.popularCategories = const [],
    this.isSubcategoriesLoading = false,
    this.subCategories = const [],
  });

  CategoriesState copyWith({
    bool? isLoading,
    List<CategoryModel>? popularCategories,
    bool? isSubcategoriesLoading,
    List<CategoryModel>? subCategories,
  }) {
    return CategoriesState(
      isLoading: isLoading ?? this.isLoading,
      popularCategories: popularCategories ?? this.popularCategories,
      isSubcategoriesLoading:
          isSubcategoriesLoading ?? this.isSubcategoriesLoading,
      subCategories: subCategories ?? this.subCategories,
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
    final categories = await _productService.getPopularCategories();
    state = state.copyWith(isLoading: false, popularCategories: categories);
  }

  Future<void> getSubCategories(int categoryId) async {
    state = state.copyWith(isSubcategoriesLoading: true);
    final subCategories = await _productService.getSubCategories(categoryId);
    state = state.copyWith(
      isSubcategoriesLoading: false,
      subCategories: subCategories,
    );
  }
}
