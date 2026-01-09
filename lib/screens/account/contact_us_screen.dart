// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/contact_us_service.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_application_2/widgets/app_bottom_alert.dart';
import 'package:flutter_application_2/widgets/app_elevated_button.dart';
import 'package:flutter_application_2/widgets/app_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ContactUsScreen extends ConsumerStatefulWidget {
  const ContactUsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContactUsScreenState();
}

class _ContactUsScreenState extends ConsumerState<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _enquiryController = TextEditingController();

  bool _isLoading = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final ContactUsService contactUsService = ContactUsService();
      bool result = await contactUsService.submitContactUs(
        _nameController.text,
        _emailController.text,
        _enquiryController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (result) {
        showBottomAlert(
          context,
          title: 'Request Submitted',
          description: 'Your enquiry request has been submitted successfully.',
          onOk: () {
            context.pop();
          },
        );
      } else {
        showBottomAlert(
          context,
          title: 'Request Failed',
          description:
              'Your enquiry request not submitted, please try again letter',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Us")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.apLogo, width: 250),
              const SizedBox(height: 30),

              /// Name
              AppTextFormField(
                controller: _nameController,
                labelText: 'Name',
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),

              /// Email
              AppTextFormField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                  ).hasMatch(value)) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),

              /// Enquiry
              AppTextFormField(
                controller: _enquiryController,
                labelText: 'Enquiry',
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enquiry is required";
                  }
                  return null;
                },
              ),

              AppElevatedButton(
                btnTitle: "Submit",
                onPressed: _submit,
                showLoading: true,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
