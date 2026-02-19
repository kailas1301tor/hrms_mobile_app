import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/local/sembast_services.dart';
import '../../../generated/assets.dart';
import '../../../res/constants/app_constants.dart';
import '../../../res/styles/color_palette.dart';
import '../../../utils/routes/route_constants.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _controller.forward().then((_) => _initializeAndNavigate());
  }

  /// All async work uses only this widget's ref (never the notifier's ref)
  /// so we avoid UnmountedRefException when the provider is disposed mid-flow.
  Future<void> _initializeAndNavigate() async {
    if (!mounted) return;
    final sembast = ref.read(sembastServicesProvider);

    try {
      await sembast.initialize();
    } catch (_) {}
    if (!mounted) return;

    AppConstants.accessToken = await sembast.getAccessToken() ?? '';
    AppConstants.refreshToken = await sembast.getRefreshToken() ?? '';
    if (!mounted) return;

    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    final loginResponse = await sembast.getLoginResponse();
    if (!mounted) return;

    final targetRoute = loginResponse != null
        ? _getTargetRoute(loginResponse.role)
        : RouteConstants.routeLoginScreen;

    Navigator.pushNamedAndRemoveUntil(context, targetRoute, (_) => false);
  }

  String _getTargetRoute(String? role) {
    if (role?.toLowerCase() == 'admin') {
      return RouteConstants.routeAdminMainScreen;
    } else if (role?.toLowerCase() == 'employee') {
      return RouteConstants.routeMainScreen;
    }
    return RouteConstants.routeLoginScreen;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ColorPalette.white,
        body: Center(
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOutBack,
            ),
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: Curves.easeIn,
              ),
              child: Image.asset(
                Assets.pngLogo,
                width: 200.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
