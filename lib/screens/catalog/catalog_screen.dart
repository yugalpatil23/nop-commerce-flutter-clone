import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../widgets/category_vertical_card.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> popularCategories = [
      CategoryModel(
        title: "Food",
        imageUrl: "https://picsum.photos/200/201",
        id: 1,
      ),
      CategoryModel(
        title: "Games",
        imageUrl: "https://picsum.photos/200/202",
        id: 2,
      ),
      CategoryModel(
        title: "Fashion",
        imageUrl: "https://picsum.photos/200/203",
        id: 3,
      ),
      CategoryModel(
        title: "Tech",
        imageUrl: "https://picsum.photos/200/204",
        id: 4,
      ),
      CategoryModel(
        title: "Home",
        imageUrl: "https://picsum.photos/200/205",
        id: 5,
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Catalog")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: popularCategories.length,
        itemBuilder: (context, index) {
          return CategoryVerticalCard(category: popularCategories[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0, thickness: 1);
        },
      ),
    );
  }
}
