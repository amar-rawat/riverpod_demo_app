import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberStateProvider = StateProvider<int>((ref) {
  return 0;
});

class Stateprovider extends ConsumerWidget {
  const Stateprovider({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int data = ref.watch(numberStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('State Provider'),
      ),
      body: Center(
        child: Text(
          data.toString(),
          style: TextStyle(fontSize: 34),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(numberStateProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
