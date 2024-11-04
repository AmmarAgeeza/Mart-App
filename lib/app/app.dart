import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  // late bool hasVisited;
  late String route;
  @override
  void initState() {
    super.initState();
    route = checkHasVisited();
  }

  String checkHasVisited() {
    var hasVisitedOnBoarding =
        sl<CacheConsumer>().getData(key: CacheKeys.visitedOnBoarding);
    var hasVisitedLogin = sl<CacheConsumer>().getData(key: CacheKeys.userUid);
    if (hasVisitedLogin != null) {
      return Routes.homeRoute;
    }
    if (hasVisitedOnBoarding == true) {
      return Routes.loginRoute;
    }
    return Routes.initialRoute;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            // hasVisited ? Routes.loginRoute : Routes.initialRoute,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            title: AppStrings.appName,
            theme: AppTheme.getAppTheme(),
          );
        });
  }
}
