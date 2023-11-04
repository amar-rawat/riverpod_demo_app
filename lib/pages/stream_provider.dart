import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberStreamProvider = StreamProvider<int>((ref) {
  return dummyStream();
});

class Streamprovider extends ConsumerWidget {
  const Streamprovider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
          child: ref.watch(numberStreamProvider).when(
                data: (data) => Text(
                  data.toString(),
                  style: const TextStyle(fontSize: 34),
                ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              )),
    );
  }
}

Stream<int> dummyStream() {
  return Stream<int>.periodic(
    const Duration(seconds: 1),
    (number) {
      return number;
    },
  ).take(100);
}
