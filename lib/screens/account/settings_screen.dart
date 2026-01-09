import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/language_provider.dart';
import 'package:flutter_application_2/utils/app_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                initialValue: locale.languageCode,
                decoration: const InputDecoration(labelText: 'Language'),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.enLang, width: 20),
                        SizedBox(width: 10),
                        Text('English'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'nl',
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.nlLang, width: 20),
                        SizedBox(width: 10),
                        Text('Deutsch'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'tr',
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.trLang, width: 20),
                        SizedBox(width: 10),
                        Text('Türkçe'),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref.read(languageProvider.notifier).changeLanguage(value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
