import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_test_app/screens/erros/connection_error_screen.dart';

import '../screens/home/home_screen.dart';
import '../splash_screen.dart';
import 'app_route_names.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
      case AppRouterNames.home:
        return MaterialPageRoute(builder: ((context) => HomeScreen()));
      case AppRouterNames.connectionError:
        return MaterialPageRoute(
            builder: ((context) => const ConnectionErrorScreen()));

      default:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));
    }
  }
}
