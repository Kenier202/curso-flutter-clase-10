import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/screens/counter/counter_provider.dart';

class RiverPod1 extends ConsumerWidget {
  static const name = 'riverpod1_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int valor = 1;
    final clickCounter = ref.watch(themeNotifierProvider).count;

    final theme = ref.watch(themeNotifierProvider).isDark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod1"),
        actions: [
          IconButton(
            icon: Icon(
              theme ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: (() {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
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
          ref
              .read(themeNotifierProvider.notifier)
              .countScreen(clickCounter + valor);
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
