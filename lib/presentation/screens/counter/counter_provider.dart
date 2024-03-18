import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final conunterProvider = StateProvider((ref) => 5);

final themeProvider = StateProvider((ref) => false);
final selectedProvider = StateProvider<int>((ref) => 0);

final colorsProvider = Provider((ref) => colorList);
