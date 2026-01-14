import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_validators.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_text_form_field.dart';

enum Gender { male, female, other }

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  //Personal Details Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  String _selectedGender = "male";

  //Company Details Controllers
  final _companyController = TextEditingController();

  //Options
  bool isNewsLatterEnable = false;

  //Password Controllers
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final _confirmPasswordController = TextEditingController();
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    // _emailController.text = "yugal@gmail.com";
    // _passwordController.text = "1234567";
    // Access providers directly in initState using ref
    // final value = ref.watch(authProvider);
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(authProvider.notifier)
          .register(
            _selectedGender,
            _firstNameController.text,
            _lastNameController.text,
            _emailController.text,
            _companyController.text,
            isNewsLatterEnable,
            _passwordController.text,
          );

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
      appBar: AppBar(title: const Text("Register")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.apLogo, width: 250),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your personal details",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),

                      DropdownButtonFormField(
                        initialValue: _selectedGender,
                        decoration: const InputDecoration(
                          labelText: 'Gender *',
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'male',
                            child: Row(
                              children: [
                                Icon(Icons.male, size: 20),
                                SizedBox(width: 10),
                                Text('Male'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'female',
                            child: Row(
                              children: [
                                Icon(Icons.female, size: 20),
                                SizedBox(width: 10),
                                Text('Female'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'other',
                            child: Row(
                              children: [
                                Icon(Icons.transgender, size: 20),
                                SizedBox(width: 10),
                                Text('Other'),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            _selectedGender = value;
                          }
                        },
                      ),
                      SizedBox(height: 25),
                      AppTextFormField(
                        prefixIcon: const Icon(Icons.person),
                        isRequired: true,
                        controller: _firstNameController,
                        labelText: 'First Name',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "First Name is required";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      AppTextFormField(
                        prefixIcon: const Icon(Icons.person),
                        isRequired: true,
                        controller: _lastNameController,
                        labelText: 'Last Name',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Last Name is required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      AppTextFormField(
                        prefixIcon: const Icon(Icons.email),
                        isRequired: true,
                        controller: _emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return AppValidators.validateEmail(value);
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Company details", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      AppTextFormField(
                        prefixIcon: const Icon(Icons.business_center),
                        isRequired: true,
                        controller: _companyController,
                        labelText: 'Company Name',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Company Name is required";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Options", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      SwitchListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: const Text('Newsletter'),
                        subtitle: const Text('Receive news and updates'),
                        value: isNewsLatterEnable,
                        onChanged: (value) {
                          setState(() => isNewsLatterEnable = value);
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      AppTextFormField(
                        prefixIcon: const Icon(Icons.key),
                        isRequired: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                      SizedBox(height: 10),

                      AppTextFormField(
                        prefixIcon: const Icon(Icons.key),
                        isRequired: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirmPassword,
                        labelText: "Confirm Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// Register Button
                AppElevatedButton(
                  btnTitle: "Register",
                  onPressed: _register,
                  showLoading: true,
                  isLoading: auth.isLoading,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
