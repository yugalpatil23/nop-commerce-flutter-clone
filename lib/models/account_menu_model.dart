import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/auth_provider.dart';
import 'package:flutter_application_2/utils/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      location: Routes.notFoundNamedScreen,
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
        location: Routes.notFoundNamedScreen,
      ),
    ]);
  } else {
    returnMenu.addAll([
      AccountMenuModel(
        'My Orders',
        Icons.shopping_bag,
        location: Routes.notFoundNamedScreen,
      ),
      AccountMenuModel(
        'Rewards',
        Icons.star_border,
        location: Routes.notFoundNamedScreen,
      ),
      AccountMenuModel(
        'Logout',
        Icons.logout,
        location: Routes.notFoundNamedScreen,
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
  ]);

  return returnMenu;
});
