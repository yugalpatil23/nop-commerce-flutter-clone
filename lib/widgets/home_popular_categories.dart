import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp_services_platform/widgets/app_circularprogress_indicator.dart';

import '../l10n/app_localizations.dart';
import '../providers/categories_provider.dart';
import 'category_item.dart';

class HomePopularCategories extends ConsumerWidget {
  const HomePopularCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularCategories = ref.watch(categoriesProvider);
    final l10n = AppLocalizations.of(context)!;
    return popularCategories.isLoading
        ? Center(child: AppCircularprogressIndicator())
        : Column(
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  itemCount: popularCategories.popularCategories.length,
                  itemBuilder: (context, index) {
                    final category = popularCategories.popularCategories[index];
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
