import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms_mobile/src/admin/main/view/admin_main_screen.dart';
import 'package:hrms_mobile/src/hr/main/view/hr_main_screen.dart';

import '../../src/home/view/home_screen.dart';
import '../../src/login/view/login_screen.dart';
import '../../src/splash/view/splash_screen.dart';
import '../../src/main/view/main_screen.dart';
import '../../src/salary/view/payslip_viewer_screen.dart';
import 'route_constants.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.routeInitial:
        return _buildRoute(RouteConstants.routeInitial, const SplashScreen());

      case RouteConstants.routeHomeScreen:
        return _buildRoute(RouteConstants.routeHomeScreen, const HomeScreen());

      case RouteConstants.routeMainScreen:
        return _buildRoute(RouteConstants.routeMainScreen, const MainScreen());

      case RouteConstants.routeLoginScreen:
        return _buildRoute(
          RouteConstants.routeLoginScreen,
          const LoginScreen(),
        );
      case RouteConstants.routeAdminMainScreen:
        return _buildRoute(
          RouteConstants.routeAdminMainScreen,
          const AdminMainScreen(),
        );
      case RouteConstants.routeHrMainScreen:
        return _buildRoute(
          RouteConstants.routeHrMainScreen,
          const HrMainScreen(),
        );

      case RouteConstants.routePayslipViewer:
        final args = settings.arguments as Map<String, String>;
        return _buildRoute(
          RouteConstants.routePayslipViewer,
          PayslipViewerScreen(
            filePath: args['filePath']!,
            fileName: args['fileName']!,
          ),
        );

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
