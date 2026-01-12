import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRewards extends ConsumerWidget {
  const MyRewards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Rewards')),
      body: Center(child: Text('My Rewards Screen')),
    );
  }
}
