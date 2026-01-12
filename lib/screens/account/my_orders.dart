import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyOrders extends ConsumerWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Orders')),
      body: Center(child: Text('My Orders Screen')),
    );
  }
}
