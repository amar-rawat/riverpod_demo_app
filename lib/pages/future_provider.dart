import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringFutureProvider = FutureProvider.autoDispose<String>((ref) {
  return dummySource();
});

class Futureprovider extends ConsumerWidget {
  const Futureprovider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Provider'),
      ),
      body: ref.watch(stringFutureProvider).when(
        data: (data) {
          return Center(
            child: Text(
              data,
              style: TextStyle(fontSize: 26),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Future<String> dummySource() {
  return Future.delayed(Duration(seconds: 3)).then(
      ((value) => 'What are you waiting for? \n I have nothing to show.'));
}
