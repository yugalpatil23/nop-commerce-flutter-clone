import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../providers/currency_provider.dart';
import '../../providers/language_provider.dart';
import '../../providers/tax_provider.dart';
import '../../utils/app_assets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);
    final currency = ref.watch(currencyProvider);
    final tax = ref.watch(taxProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DropdownButtonFormField(
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
              SizedBox(height: 30),
              DropdownButtonFormField(
                initialValue: currency,
                decoration: const InputDecoration(labelText: 'Currency'),
                items: [
                  DropdownMenuItem(
                    value: 'USD',
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.enLang, width: 20),
                        SizedBox(width: 10),
                        Text('US Dollar'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'EUR',
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.nlLang, width: 20),
                        SizedBox(width: 10),
                        Text('Euro'),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref.read(currencyProvider.notifier).changeCurrency(value);
                  }
                },
              ),
              SizedBox(height: 30),
              DropdownButtonFormField(
                initialValue: tax,
                decoration: const InputDecoration(labelText: 'Tax'),
                items: [
                  DropdownMenuItem(
                    value: 'excludingTax',
                    child: Row(
                      children: [
                        // SvgPicture.asset(AppAssets.enLang, width: 20),
                        // SizedBox(width: 10),
                        Text('excludingTax'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'includingTax',
                    child: Row(
                      children: [
                        // SvgPicture.asset(AppAssets.nlLang, width: 20),
                        // SizedBox(width: 10),
                        Text('includingTax'),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    ref.read(taxProvider.notifier).changeTax(value);
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
