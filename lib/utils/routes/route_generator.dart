import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../src/home/view/home_screen.dart';
import '../../src/splash/view/splash_screen.dart';
import 'route_constants.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.routeInitial:
        return _buildRoute(RouteConstants.routeInitial, const SplashScreen());

      case RouteConstants.routeHomeScreen:
        return _buildRoute(RouteConstants.routeHomeScreen, const HomeScreen());

      default:
        return _buildRoute(
          RouteConstants.routeEmpty,
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Route<dynamic> _buildRoute(String route, Widget widget) {
    return CupertinoPageRoute(
      settings: RouteSettings(name: route),
      builder: (_) => widget,
    );
  }
}

class GlobalNavigator {
  static Future<dynamic>? pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void pop() {
    return navigatorKey.currentState?.pop();
  }

  static Future<dynamic>? pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic>? pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
