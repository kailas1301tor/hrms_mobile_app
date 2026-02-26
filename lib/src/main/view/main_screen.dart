import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrms_mobile/res/constants/string_constants.dart';
import 'package:hrms_mobile/src/home/view/home_screen.dart';
import 'package:hrms_mobile/src/track/view/track_screen.dart';
import 'package:hrms_mobile/src/salary/view/salary_screen.dart';
import 'package:hrms_mobile/src/main/view/widgets/bottom_navigation_section.dart';

import '../../../res/styles/color_palette.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../res/styles/app_theme.dart';

import 'widgets/custom_common_app_bar.dart';
import '../../settings/view/settings_screen.dart';

// Manual Notifier instead of riverpod_generator for simplicity
class SelectedTabNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

final selectedTabProvider = NotifierProvider<SelectedTabNotifier, int>(() {
  return SelectedTabNotifier();
});

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  DateTime? _lastBackPressTime;

  @override
  void initState() {
    super.initState();
  }

  void _showExitToast() {
    showCustomToast(
      message: Strings.exitPressAgain,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(selectedTabProvider);
    final pages = [
      const HomeScreen(),
      const TrackScreen(),
      const StaffSalaryScreen(),
      const SettingsScreen(),
    ];

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        final state = _navigatorKey.currentState;

        if (selectedTab == 1 && (state?.canPop() ?? false)) {
          state?.pop();
          return;
        }

        if (selectedTab != 0) {
          ref.read(selectedTabProvider.notifier).set(0);
          return;
        }

        final now = DateTime.now();
        const doubleTapDuration = Duration(seconds: 2);

        if (_lastBackPressTime == null ||
            now.difference(_lastBackPressTime!) > doubleTapDuration) {
          _lastBackPressTime = now;
          _showExitToast();
          return;
        }

        SystemNavigator.pop();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.systemOverlayStyle,
        child: Scaffold(
          appBar: const CustomCommonAppBar(),
          backgroundColor: ColorPalette.white,
          body: IndexedStack(index: selectedTab, children: pages),
          bottomNavigationBar: BottomNavigationSection(
            selectedTab: selectedTab,
            onTabSelected: (index) {
              ref.read(selectedTabProvider.notifier).set(index);
            },
          ),
        ),
      ),
    );
  }
}
