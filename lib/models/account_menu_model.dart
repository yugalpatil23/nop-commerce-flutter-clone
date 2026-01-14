import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../utils/app_routes_constants.dart';

class AccountMenuModel {
  final String title;
  final IconData icon;
  final String location;

  AccountMenuModel(this.title, this.icon, {required this.location});
}

final menuProvider = Provider<List<AccountMenuModel>>((ref) {
  final isLoggedIn = ref.watch(authProvider).isLoggedIn;

  List<AccountMenuModel> returnMenu = [
    AccountMenuModel(
      'Wishlist',
      Icons.favorite_outline,
      location: Routes.wishlistNamedScreen,
    ),
  ];

  if (!isLoggedIn) {
    returnMenu.addAll([
      AccountMenuModel(
        'Login',
        Icons.login,
        location: '${Routes.accountNamedScreen}${Routes.loginNamedScreen}',
      ),
      AccountMenuModel(
        'Register',
        Icons.app_registration,
        location: Routes.registerNamedScreen,
      ),
    ]);
  } else {
    returnMenu.addAll([
      AccountMenuModel(
        'My Orders',
        Icons.shopping_bag,
        location: Routes.myOrdersNamedScreen,
      ),
      AccountMenuModel(
        'Rewards',
        Icons.star_border,
        location: Routes.myRewardsNamedScreen,
      ),
    ]);
  }

  returnMenu.addAll([
    AccountMenuModel(
      'Setting',
      Icons.settings_outlined,
      location: Routes.settingsNamedScreen,
    ),
    AccountMenuModel(
      'Contact Us',
      Icons.help_outline,
      location: Routes.contactUsNamedScreen,
    ),
    AccountMenuModel(
      'Change Theme Mode',
      Icons.contrast_outlined,
      location: '${Routes.accountNamedScreen}${Routes.changeThemeNamedScreen}',
    ),
    AccountMenuModel('Webview', Icons.web, location: Routes.webviewNamedScreen),
  ]);

  if (isLoggedIn) {
    returnMenu.addAll([
      AccountMenuModel(
        'Logout',
        Icons.logout,
        location: Routes.notFoundNamedScreen,
      ),
    ]);
  }

  return returnMenu;
});
