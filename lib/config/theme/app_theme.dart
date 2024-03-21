import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDark;
  final int count;

  AppTheme({
    this.selectedColor = 0,
    this.isDark = false,
    this.count = 0,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDark,
    int? count,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDark: isDark ?? this.isDark,
        count: count ?? this.count,
      );
}
