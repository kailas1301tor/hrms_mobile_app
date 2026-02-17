import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_mobile/res/constants/string_constants.dart';
import 'package:hrms_mobile/src/home/view/home_screen.dart';
import 'package:hrms_mobile/src/track/view/track_screen.dart';
import 'package:hrms_mobile/src/salary/view/salary_screen.dart';
import 'package:hrms_mobile/src/exit/view/exit_screen.dart';

import '../../../generated/assets.dart';
import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../utils/helpers/common_functions.dart';
import '../../../res/styles/app_theme.dart';

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
      const SalaryScreen(),
      const ExitScreen(),
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
          backgroundColor: ColorPalette.white,
          body: IndexedStack(index: selectedTab, children: pages),
          bottomNavigationBar: BottomNavigationSection(
            selectedTab: selectedTab,
            onTabSelected: (index) =>
                ref.read(selectedTabProvider.notifier).set(index),
          ),
        ),
      ),
    );
  }
}

// Bottom Navigation Section
class BottomNavigationSection extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabSelected;

  const BottomNavigationSection({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: ColorPalette.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade200, width: 1.w),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavTile(
              index: 0,
              selectedIndex: selectedTab,
              label: Strings.navHome,
              enabledIcon: Assets.svgHomeNav,
              disabledIcon: Assets.svgHomeNav,
              onTap: () => onTabSelected(0),
            ),
            BottomNavTile(
              index: 1,
              selectedIndex: selectedTab,
              label: Strings.navSchedule,
              enabledIcon: Assets.svgTrack,
              disabledIcon: Assets.svgTrack,
              onTap: () => onTabSelected(1),
            ),
            BottomNavTile(
              index: 2,
              selectedIndex: selectedTab,
              label: Strings.navReport,
              enabledIcon: Assets.svgSalary,
              disabledIcon: Assets.svgSalary,
              onTap: () => onTabSelected(2),
            ),
            BottomNavTile(
              index: 3,
              selectedIndex: selectedTab,
              label: Strings.navSettings,
              enabledIcon: Assets.svgSettingsNav,
              disabledIcon: Assets.svgSettingsNav,
              onTap: () => onTabSelected(3),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String label;
  final String enabledIcon;
  final String disabledIcon;
  final VoidCallback onTap;

  const BottomNavTile({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.label,
    required this.enabledIcon,
    required this.disabledIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected ? enabledIcon : disabledIcon,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                isSelected ? ColorPalette.primaryColor : ColorPalette.fB0B0B0,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              label,
              style: TextStyle(
                fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
                fontSize: 10.sp,
                color: isSelected
                    ? ColorPalette.primaryColor
                    : ColorPalette.fB0B0B0,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
