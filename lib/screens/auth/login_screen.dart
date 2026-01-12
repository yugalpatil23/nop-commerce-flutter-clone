import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_routes_constants.dart';
import '../../utils/app_validators.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/app_text_form_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController.text = "yugal@gmail.com";
    _passwordController.text = "1234567";
    // Access providers directly in initState using ref
    // final value = ref.watch(authProvider);
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(authProvider.notifier)
          .login(_emailController.text, _passwordController.text);

      final auth = ref.watch(authProvider);
      log("__________${auth.isLoggedIn}");
      if (auth.isLoggedIn) {
        context.pop();
      }
      // TODO: API Call
      // Future.delayed(const Duration(seconds: 2), () {
      //   setState(() => _isLoading = false);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.apLogo, width: 250),
              const SizedBox(height: 30),

              /// Email
              AppTextFormField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return AppValidators.validateEmail(value);
                },
              ),

              const SizedBox(height: 16),

              /// Password
              AppTextFormField(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                controller: _passwordController,
                obscureText: _obscurePassword,
                labelText: "Password",
                validator: (value) {
                  return AppValidators.validatePassword(value);
                },
              ),

              const SizedBox(height: 25),

              /// Login Button
              AppElevatedButton(
                btnTitle: "Login",
                onPressed: _login,
                showLoading: true,
                isLoading: auth.isLoading,
              ),
              const SizedBox(height: 8),

              /// Forgot Password
              AppTextButton(
                title: "Forgot Password?",
                onPressed: () => context.go(
                  '${Routes.accountNamedScreen}${Routes.loginNamedScreen}${Routes.forgotPasswordNamedScreen}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
