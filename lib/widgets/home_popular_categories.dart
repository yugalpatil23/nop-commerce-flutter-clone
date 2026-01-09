import 'package:flutter/material.dart';
import 'package:flutter_application_2/l10n/app_localizations.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/category_model.dart';
import 'package:flutter_application_2/widgets/category_item.dart';

class HomePopularCategories extends StatefulWidget {
  const HomePopularCategories({super.key});

  @override
  State<HomePopularCategories> createState() => _HomePopularCategoriesState();
}

class _HomePopularCategoriesState extends State<HomePopularCategories> {
  List<CategoryModel> get popularCategories => [
    CategoryModel(
      title: AppLocalizations.of(context)!.food,
      imageUrl: "https://picsum.photos/200/201",
    ),
    CategoryModel(title: "Games", imageUrl: "https://picsum.photos/200/202"),
    CategoryModel(title: "Fashion", imageUrl: "https://picsum.photos/200/203"),
    CategoryModel(title: "Tech", imageUrl: "https://picsum.photos/200/204"),
    CategoryModel(title: "Home", imageUrl: "https://picsum.photos/200/205"),
  ];
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            l10n.popular_categories,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemCount: popularCategories.length,
            itemBuilder: (context, index) {
              final category = popularCategories[index];
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: CategoryItem(category: category),
              );
            },
          ),
        ),
      ],
    );
  }
}
