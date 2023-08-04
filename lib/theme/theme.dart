import 'package:flutter/material.dart';

class FlutterTodosTheme {
  static ThemeData get light {
    return ThemeData(
      // primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Color(0xFF13B9FF),
      ),
      colorScheme: ColorScheme.fromSwatch(
        // backgroundColor: const Color.fromARGB(255, 16, 24, 40),
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(shape: CircleBorder()),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFF13B9FF),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(shape: CircleBorder()),
    );
  }
}
