import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/not_found_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const root = '/';
  static const splashNamedScreen = '/splash';
  static const homeNamedScreen = '/home';
  static const homeDetailsNamedScreen = 'details';
  static const catalogNamedScreen = '/catalog';
  static const cartNamedScreen = '/cart';
  static const notFoundNamedScreen = '/notfound';

  //Account
  static const accountNamedScreen = '/account';
  static const changeThemeNamedScreen = '/changeThemeMode';
  static const loginNamedScreen = '/login';
  static const forgotPasswordNamedScreen = '/forgotPassword';
  static const settingsNamedScreen = '/settings';

  //Product
  static const productDetailsNamedScreen = '/productDetails';

  // static profileNamedPage([String? name]) => '/${name ?? ':profile'}';
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundScreen();
}

class AppConstants {
  static String themeModeKey = 'parentpay_theme_mode';
  static String parentPayAuthToken = 'parent_pay_auth_token';
}
