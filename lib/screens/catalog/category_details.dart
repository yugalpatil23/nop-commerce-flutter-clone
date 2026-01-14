import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp_services_platform/providers/categories_provider.dart';
import 'package:pp_services_platform/widgets/app_circularprogress_indicator.dart';

import '../../models/category_model.dart';
import '../../widgets/category_vertical_card.dart';

class CategoryDetails extends ConsumerStatefulWidget {
  const CategoryDetails({super.key, required this.category});

  final CategoryModel category;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryDetailsState();
}

class _CategoryDetailsState extends ConsumerState<CategoryDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(categoriesProvider.notifier)
          .getSubCategories(widget.category.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesStore = ref.watch(categoriesProvider);

    return Scaffold(
      // appBar: AppBar(title: Text(category.title)),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.category.title),
              background: Image.network(
                "https://picsum.photos/200",
                fit: BoxFit.fill,
              ),
            ),
          ),
          categoriesStore.isSubcategoriesLoading
              ? SliverFillRemaining(
                  child: Center(child: AppCircularprogressIndicator()),
                )
              : SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverList.builder(
                    itemCount: categoriesStore.subCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          CategoryVerticalCard(
                            category: categoriesStore.subCategories[index],
                          ),
                          Divider(height: 0, thickness: 1),
                        ],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
