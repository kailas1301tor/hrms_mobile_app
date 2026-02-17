import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/inter_font_palette.dart';
import '../../../utils/routes/route_constants.dart';
import '../notifier/splash_notifier.dart';
import 'dart:async';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _glowController;
  late List<Animation<double>> _letterAnimations;
  late Animation<double> _glowAnimation;

  late SplashNotifier _splashNotifier;
  final String _appName = 'Sample App';

  @override
  void initState() {
    super.initState();
    _splashNotifier = ref.read(splashProvider.notifier);

    // Main animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Glow pulse controller
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    // Glow animation: safe range [0.0, 1.0]
    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Build robust letter-by-letter intervals and animations
    _letterAnimations = List.generate(_appName.length, (index) {
      final double start = (index * 0.1);
      final double endRaw = start + 0.30;
      // Ensure we stay within [0.0, 1.0] and begin < end
      final double begin = start.clamp(0.0, 0.99);
      double end = endRaw.clamp(0.01, 1.0);
      if (end <= begin) {
        // guarantee a small positive range if clamping caused a conflict
        end = (begin + 0.01).clamp(0.01, 1.0);
      }

      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(begin, end, curve: Curves.easeOutBack),
        ),
      );
    });

    // Start animations and initialize navigation after completion
    _controller.forward().then((_) => _initializeAndNavigate());
  }

  Future<void> _initializeAndNavigate() async {
    try {
      await _splashNotifier.initialize();
    } catch (_) {}
    await _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteConstants.routeHomeScreen,
      (route) => false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _glowController.dispose();
    super.dispose();
  }

  double _safeDouble(num? v) {
    if (v == null) return 0.0;
    final d = v.toDouble();
    if (d.isNaN) return 0.0;
    return d.clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([_controller, _glowController]),
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Glowing pulse effect (use safe value)
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      final glowVal = _safeDouble(_glowAnimation.value);
                      return Container(
                        width: 200.w * (0.9 + 0.2 * glowVal),
                        height: 200.w * (0.9 + 0.2 * glowVal),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: ColorPalette.accentColor.withOpacity(
                                (glowVal * 0.5).clamp(0.0, 1.0),
                              ),
                              blurRadius: (60 * glowVal).clamp(0.0, 200.0),
                              spreadRadius: (20 * glowVal).clamp(0.0, 80.0),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // App name with letter-by-letter animation
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_appName.length, (index) {
                      final anim = _letterAnimations[index];
                      return AnimatedBuilder(
                        animation: anim,
                        builder: (context, child) {
                          final raw = _safeDouble(anim.value);
                          // scale: keep between 0.6 and 1.0 for nicer pop
                          final scale = (0.6 + 0.4 * raw).clamp(0.6, 1.0);
                          final opacity = raw.clamp(0.0, 1.0);
                          return Transform.scale(
                            scale: scale,
                            child: Opacity(
                              opacity: opacity,
                              child: Text(
                                _appName[index],
                                style: InterFontPalette.fWhite_32_700.copyWith(
                                  fontSize: 48.sp,
                                  shadows: [
                                    Shadow(
                                      color: ColorPalette.accentColor
                                          .withOpacity(0.8),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
