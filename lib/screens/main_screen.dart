import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/active_bottom_tab_provider.dart';
import 'package:flutter_application_2/utils/app_constants.dart';
import 'package:flutter_application_2/widgets/named_nav_bar_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  final Widget screen;

  MainScreen({super.key, required this.screen});

  final tabs = [
    NamedNavigationBarItemWidget(
      initialLocation: Routes.homeNamedScreen,
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.catalogNamedScreen,
      icon: const Icon(Icons.menu),
      label: 'Catalog',
    ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.cartNamedScreen,
      icon: const Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    NamedNavigationBarItemWidget(
      initialLocation: Routes.accountNamedScreen,
      icon: const Icon(Icons.person),
      label: 'Account',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(activeTabProvider); // <-- Riverpod watch

    return Scaffold(
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(activeTabProvider.notifier).state = index; // update provider
          context.go(tabs[index].initialLocation); // navigate
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 5,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(
          size: ((IconTheme.of(context).size)! * 1.3),
        ),
        type: BottomNavigationBarType.fixed,
        items: tabs,
      ),
    );
  }
}
