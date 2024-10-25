import 'package:flutter/material.dart';

import '../core/database/cache/cache_consumer.dart';
import '../core/database/cache/cache_keys.dart';
import '../core/services/service_locator.dart';
import '../core/themes/app_theme.dart';
import '../core/utils/app_routes.dart';
import '../core/utils/app_strings.dart';

class MartApp extends StatefulWidget {
  const MartApp({super.key});

  @override
  State<MartApp> createState() => _MartAppState();
}

class _MartAppState extends State<MartApp> {
  late bool hasVisited;
  @override
  void initState() {
    super.initState();
    hasVisited = checkHasVisited();
  }

  bool checkHasVisited()  {
  var hasVisited =  sl<CacheConsumer>().getData(key: CacheKeys.visitedOnBoarding);
  if (hasVisited == null) {
    return false;
  }
  return hasVisited;

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: hasVisited ? Routes.register : Routes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: AppStrings.appName,
      theme: AppTheme.getAppTheme(),
    );
  }
}
