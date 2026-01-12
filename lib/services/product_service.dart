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
}
