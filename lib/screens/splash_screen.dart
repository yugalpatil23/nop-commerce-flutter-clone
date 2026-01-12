import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onInitialize();
  }

  void onInitialize() async {
    Future.delayed(const Duration(seconds: 2), () {
      context.go(Routes.homeNamedScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.apLogo, width: 250),
            SizedBox(height: 50),
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
