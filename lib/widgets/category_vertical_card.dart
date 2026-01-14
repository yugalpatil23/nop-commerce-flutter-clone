import 'package:flutter/material.dart';

import '../models/category_model.dart';

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
