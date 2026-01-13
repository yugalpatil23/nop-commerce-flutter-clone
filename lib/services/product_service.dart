import '../l10n/app_localizations.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getCarousel() async {
    await Future.delayed(const Duration(seconds: 3));

    return [
      ProductModel(
        id: 101,
        name: "Wireless Headphones",
        category: "Electronics",
        imageUrl: "https://picsum.photos/600/300",
        rating: 4.5,
        price: 79,
        oldPrice: 99,
      ),
      ProductModel(
        id: 102,
        name: "Running Shoes",
        category: "Fashion",
        imageUrl: "https://picsum.photos/600/301",
        rating: 4.2,
        price: 59,
      ),
      ProductModel(
        id: 103,
        name: "Smart Watch Pro",
        category: "Electronics",
        imageUrl: "https://picsum.photos/600/302",
        rating: 4.6,
        price: 129,
        oldPrice: 179,
      ),
    ];
  }

  Future<List<CategoryModel>> getPopularCategories() async {
    await Future.delayed(const Duration(seconds: 3));

    return [
      CategoryModel(title: "Food", imageUrl: "https://picsum.photos/200/201"),
      CategoryModel(title: "Games", imageUrl: "https://picsum.photos/200/202"),
      CategoryModel(
        title: "Fashion",
        imageUrl: "https://picsum.photos/200/203",
      ),
      CategoryModel(title: "Tech", imageUrl: "https://picsum.photos/200/204"),
      CategoryModel(title: "Home", imageUrl: "https://picsum.photos/200/205"),
    ];
  }
}
