import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/not_found_screen.dart';

class Routes {
  static const root = '/';
  static const splashNamedScreen = '/splash';
  static const homeNamedScreen = '/home';
  static const homeDetailsNamedScreen = 'details';
  static const cartNamedScreen = '/cart';
  static const notFoundNamedScreen = '/notfound';
  static const wishlistNamedScreen = '/wishlist';

  //category / Catalog
  static const catalogNamedScreen = '/catalog';
  static const categoryDetailsNamedScreen = '/categoryDetails';

  //Account
  static const accountNamedScreen = '/account';
  static const changeThemeNamedScreen = '/changeThemeMode';
  static const settingsNamedScreen = '/settings';
  static const contactUsNamedScreen = '/contactUs';
  static const myOrdersNamedScreen = '/myOrders';
  static const myRewardsNamedScreen = '/myRewards';

  // Authentication
  static const loginNamedScreen = '/login';
  static const registerNamedScreen = '/register';
  static const forgotPasswordNamedScreen = '/forgotPassword';

  //Product
  static const productDetailsNamedScreen = '/productDetails';

  // static profileNamedPage([String? name]) => '/${name ?? ':profile'}';
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();
}
