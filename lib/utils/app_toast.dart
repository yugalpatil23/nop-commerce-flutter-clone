import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

void showAppToast(String message, {Color? color}) {
  final context = rootNavigatorKey.currentContext!;
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: color != null ? Colors.white : colorScheme.onInverseSurface,
        ),
      ),
      backgroundColor: color ?? colorScheme.inverseSurface,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 2),
    ),
  );
}
