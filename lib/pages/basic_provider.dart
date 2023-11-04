import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = Provider<String>((ref) {
  return 'This is basic provider';
});

class Basicprovider extends ConsumerWidget {
  const Basicprovider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String data = ref.read(stringProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Provider'),
      ),
      body: Center(
        child: Text(
          data,
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
