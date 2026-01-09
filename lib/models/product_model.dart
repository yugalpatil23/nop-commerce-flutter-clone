class ProductModel {
  final String name;
  final String category;
  final String imageUrl;
  final double rating;
  final double price;
  final double? oldPrice;

  ProductModel({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.rating,
    required this.price,
    this.oldPrice,
  });
}
