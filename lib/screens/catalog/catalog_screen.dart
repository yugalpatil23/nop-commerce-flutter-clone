import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/category_model.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> popularCategories = [
      CategoryModel(title: "Food", imageUrl: "https://picsum.photos/200/201"),
      CategoryModel(title: "Games", imageUrl: "https://picsum.photos/200/202"),
      CategoryModel(
        title: "Fashion",
        imageUrl: "https://picsum.photos/200/203",
      ),
      CategoryModel(title: "Tech", imageUrl: "https://picsum.photos/200/204"),
      CategoryModel(title: "Home", imageUrl: "https://picsum.photos/200/205"),
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

class CategoryVerticalCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryVerticalCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      elevation: 0,
      color: theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          print("Clicked ${category.title}");
        },
        child: Row(
          children: [
            /// 🔹 Category Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                category.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            /// 🔹 Category Name
            Expanded(
              child: Text(
                category.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// 🔹 Arrow Icon
            Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
