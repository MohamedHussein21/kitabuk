import 'package:flutter/material.dart';
import 'package:mybook/features/auth/pages/login_screen.dart';
import 'package:mybook/features/auth/pages/register_screen.dart';
import 'package:mybook/features/splach/pages/splach.dart';

import '../../features/home/presentation/pages/home_screen.dart';

class Routes {
  static const String intialRoute = '/';
  static const String loginRoute = 'login';
  static const String registerRoute = 'register';

  static const String homeRoute = 'home';
  static const String bookInfoRoute = 'details';
}

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intialRoute:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));

      case Routes.loginRoute:
        return MaterialPageRoute(builder: ((context) => const LoginScreen()));

      case Routes.registerRoute:
        return MaterialPageRoute(
            builder: ((context) => const RegisterScreen()));

      case Routes.homeRoute:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));

      default:
        return null;
    }
  }
}
