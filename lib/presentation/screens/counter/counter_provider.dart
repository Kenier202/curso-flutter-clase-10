import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorsProvider = Provider((ref) => colorList);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDark: !state.isDark);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }

  void countScreen(int count) {
    state = state.copyWith(count: count);
    print("dentro de providers $count");
  }
}
