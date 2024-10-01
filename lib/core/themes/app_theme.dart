import 'package:flutter/material.dart';

import '../utils/app_fonts.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: AppFonts.fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      ),
      useMaterial3: true,
    );
  }
}
