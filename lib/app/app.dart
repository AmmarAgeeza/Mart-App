import 'package:flutter/material.dart';

import '../core/themes/app_theme.dart';
import '../core/utils/app_strings.dart';

class MartApp extends StatelessWidget {
  const MartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.getAppTheme(),
      home: const Scaffold(),
    );
  }
}
