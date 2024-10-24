import 'package:flutter/material.dart';
import 'package:mart_app/features/auth/presentation/screens/login_screen.dart';
import 'package:mart_app/features/onboarding/presentation/screens/on_boarding_screens.dart';

import 'app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = 'login';
  static const String onBoardingRoute = 'onBoarding';
  static const String homeRoute = 'home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreens(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreens(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
