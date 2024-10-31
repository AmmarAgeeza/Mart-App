import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../services/service_locator.dart';
import '/features/auth/presentation/cubit/login/login_cubit.dart';
import '/features/auth/presentation/cubit/register/register_cubit.dart';
import '/features/auth/presentation/cubit/reset_password/reset_password_cubit.dart';
import '/features/auth/presentation/screens/login_screen.dart';
import '/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import '/features/onboarding/presentation/screens/on_boarding_screens.dart';

import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/reset_password_screen.dart';
import 'app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = 'onBoarding';
  static const String loginRoute = 'login';
  static const String register = 'register';
  static const String resetPassword = 'resetPassword';
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
            create: (context) => LoginCubit(sl()),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(sl()),
            child: const RegisterScreen(),
          ),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ResetPasswordCubit(sl()),
            child: const ResetPasswordScreen(),
          ),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
