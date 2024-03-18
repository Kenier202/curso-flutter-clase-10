// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/screens/counter/counter_provider.dart';

class RiverPod1 extends ConsumerWidget {
  static const name = 'riverpod1_screen';
  const RiverPod1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(conunterProvider);
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod1"),
        actions: [
          IconButton(
            icon: Icon(
              theme ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: (() {
              ref.read(themeProvider.notifier).update((state) => !state);
            }),
          )
        ],
      ),
      body: Center(
        child: Text(
          "valor $clickCounter",
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          ref.read(conunterProvider.notifier).state++;
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
