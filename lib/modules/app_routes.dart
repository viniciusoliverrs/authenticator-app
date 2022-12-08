import 'package:authenticator_app/modules/home/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'auth/presentation/pages/auth_page.dart';

class Routes {
  static const String auth = 'auth';
  static const String home = 'home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (context) => const AuthPage());
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(title: 'Home Page'),
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
