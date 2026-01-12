import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_validators.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_text_button.dart';
import '../../widgets/app_text_form_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  bool _isLoading = false;

  void _recoverPassword() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // TODO: API Call
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Password Recovery")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.apLogo, width: 250),
            const SizedBox(height: 30),
            Text(
              "Please enter your email address below. Ypu will receive a link to reset your password.",
            ),

            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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

                  const SizedBox(height: 41),

                  /// Login Button
                  AppElevatedButton(
                    btnTitle: "Recover",
                    onPressed: _recoverPassword,
                    showLoading: true,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 8),

                  AppTextButton(
                    title: "Back to login.",
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
