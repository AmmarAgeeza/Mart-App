import 'package:flutter/material.dart';

import '../core/themes/app_theme.dart';
import '../core/utils/app_routes.dart';
import '../core/utils/app_strings.dart';

class MartApp extends StatelessWidget {
  const MartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: AppStrings.appName,
      theme: AppTheme.getAppTheme(),
    );
  }
}
