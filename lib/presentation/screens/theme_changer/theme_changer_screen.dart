import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/screens/counter/counter_provider.dart';

class changeScreen extends ConsumerWidget {
  static const name = 'changeScreen';

  const changeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider).isDark;

    return Scaffold(
        appBar: AppBar(
          title: const Text(name),
          actions: [
            IconButton(
              icon: Icon(
                  theme ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
              onPressed: (() {
                // ref.read(themeProvider.notifier).state = !theme;
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              }),
            ),
          ],
        ),
        body: themeChangeViewer());
  }
}

class themeChangeViewer extends ConsumerWidget {
  const themeChangeViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorsProvider);

    // final int selected = ref.watch(selectedProvider);

    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            "Este color",
            style: TextStyle(color: color),
          ),
          subtitle: Text("$color.value"),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
