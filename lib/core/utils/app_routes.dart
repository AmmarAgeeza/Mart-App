import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mart_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:mart_app/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:mart_app/features/auth/presentation/screens/login_screen.dart';
import 'package:mart_app/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:mart_app/features/onboarding/presentation/screens/on_boarding_screens.dart';

import '../../features/auth/presentation/screens/register_screen.dart';
import 'app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = 'login';
  static const String register = 'register';
  static const String onBoardingRoute = 'onBoarding';
  static const String homeRoute = 'home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnBoardingCubit(),
            child: const OnBoardingScreens(),
          ),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterScreen(),
          ),
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
