import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../screens/account/account_screen.dart';
import '../screens/account/contact_us_screen.dart';
import '../screens/account/settings_screen.dart';
import '../screens/account/theme_mode_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/catalog/catalog_screen.dart';
import '../screens/home/home_details_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/main_screen.dart';
import '../screens/not_found_screen.dart';
import '../screens/products/product_details_screen.dart';
import '../screens/splash_screen.dart';
import '../utils/app_routes_constants.dart';

class AppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.splashNamedScreen,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.splashNamedScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.settingsNamedScreen,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: Routes.registerNamedScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: Routes.contactUsNamedScreen,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: '${Routes.productDetailsNamedScreen}/:id',
        builder: (context, state) {
          final productId = 55;
          // final productId = state.pathParameters['id']!;
          return ProductDetailsScreen(productId: productId);
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainScreen(screen: child);
        },
        routes: [
          GoRoute(
            path: Routes.homeNamedScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
            routes: [
              GoRoute(
                path: Routes.homeDetailsNamedScreen,
                builder: (context, state) => const HomeDetailsScreen(),
              ),
            ],
          ),

          GoRoute(
            path: Routes.catalogNamedScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CatalogScreen()),
          ),
          GoRoute(
            path: Routes.cartNamedScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CartScreen()),
            routes: [],
          ),
          GoRoute(
            path: Routes.accountNamedScreen,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AccountScreen()),
            routes: [
              GoRoute(
                path: Routes.changeThemeNamedScreen,
                builder: (context, state) => const ThemeModeScreen(),
              ),
              GoRoute(
                path: Routes.loginNamedScreen,
                builder: (context, state) => const LoginScreen(),
                routes: [
                  GoRoute(
                    path: Routes.forgotPasswordNamedScreen,
                    builder: (context, state) => const ForgotPasswordScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}
