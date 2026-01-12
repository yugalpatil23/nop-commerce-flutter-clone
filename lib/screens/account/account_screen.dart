import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../../models/account_menu_model.dart';
import '../../providers/auth_provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_bottom_alert.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final menus = ref.watch(menuProvider);
    final l10n = AppLocalizations.of(context)!;

    logoutClick() {
      showBottomAlert(
        context,
        title: 'Logout',
        description: 'Are you sure you want to logout?',
        okText: "Logout",
        OKButtonColor: AppColors.errorColor,
        cancelText: "Cancel",
        onOk: () {
          ref.read(authProvider.notifier).logout();
        },
        okTextColor: Colors.white,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          auth.isLoggedIn ? 'Welcome ${auth.user!.name}' : 'My Account',
        ),
      ),

      // drawer: Drawer(
      //   // Add the Drawer here
      //   child: ListView(
      //     // Use ListView to make the drawer scrollable if content exceeds screen height
      //     padding: EdgeInsets.zero, // Remove default padding
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(color: AppColors.primaryColor),
      //         child: Column(
      //           children: [
      //             CircleAvatar(
      //               backgroundColor: Colors.blueGrey,
      //               child: const Text('MA', style: TextStyle(fontSize: 24)),
      //               radius: 40,
      //             ),
      //             SizedBox(height: 15),
      //             Text(
      //               'My Account',
      //               style: TextStyle(color: Colors.white, fontSize: 24),
      //             ),
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.the),
      //         title: const Text('Setting'),
      //         onTap: () {
      //           // Update the state of the app (e.g., navigate to a different page)
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.help),
      //         title: const Text('Contact Us'),
      //         onTap: () {
      //           // Handle the tap action
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: auth.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: menus.length,
              separatorBuilder: (_, __) => Divider(
                height:
                    0, // Controls the total vertical space occupied by the widget
              ),
              itemBuilder: (context, index) {
                final item = menus[index];
                return ListTile(
                  leading: Icon(item.icon),
                  title: Text(item.title),
                  onTap: () {
                    log("loggg---${item.location}");
                    if (item.title == 'Logout') {
                      logoutClick();
                    } else {
                      context.push(item.location);
                    }
                  },
                );
              },
            ),
    );
  }
}
