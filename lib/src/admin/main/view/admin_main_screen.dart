import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import 'package:hrms_mobile/res/constants/string_constants.dart';
import 'package:hrms_mobile/src/admin/summary/view/admin_summary_screen.dart';
import 'package:hrms_mobile/src/admin/attendance/view/admin_attendance_screen.dart';
import 'package:hrms_mobile/src/admin/requests/view/admin_requests_screen.dart';
import 'package:hrms_mobile/src/main/view/widgets/custom_common_app_bar.dart';
import '../../../../generated/assets.dart';
import '../../../../res/styles/app_theme.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../utils/helpers/common_functions.dart';
import '../../../settings/view/settings_screen.dart';

class SelectedTabNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

final adminSelectedTabProvider = NotifierProvider<SelectedTabNotifier, int>(() {
  return SelectedTabNotifier();
});

class AdminMainScreen extends ConsumerStatefulWidget {
  const AdminMainScreen({super.key});

  @override
  ConsumerState<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends ConsumerState<AdminMainScreen> {
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
    final selectedTab = ref.watch(adminSelectedTabProvider);
    final pages = [
      const AdminSummaryScreen(),
      const AdminAttendanceScreen(),
      const AdminRequestsScreen(),
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
          ref.read(adminSelectedTabProvider.notifier).set(0);
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
          appBar: CustomCommonAppBar(
            title: AppConstants.user,
            subtitle: "ADMIN",
          ),
          backgroundColor: ColorPalette.white,
          body: SafeArea(
            bottom: false,
            child: IndexedStack(index: selectedTab, children: pages),
          ),
          bottomNavigationBar: AdminBottomNavigationSection(
            selectedTab: selectedTab,
            onTabSelected: (index) {
              ref.read(adminSelectedTabProvider.notifier).set(index);
            },
          ),
        ),
      ),
    );
  }
}

// Bottom Navigation Section
class AdminBottomNavigationSection extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabSelected;

  const AdminBottomNavigationSection({
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
              label: Strings.adminNavSummary,
              enabledIcon: Assets.svgHomeNav,
              disabledIcon: Assets.svgHomeNav,
              onTap: () => onTabSelected(0),
            ),
            BottomNavTile(
              index: 1,
              selectedIndex: selectedTab,
              label: Strings.adminNavAttendance,
              enabledIcon: Assets.svgTrack,
              disabledIcon: Assets.svgTrack,
              onTap: () => onTabSelected(1),
            ),
            BottomNavTile(
              index: 2,
              selectedIndex: selectedTab,
              label: Strings.adminNavRequests,
              enabledIcon: Assets.svgSalary,
              disabledIcon: Assets.svgSalary,
              onTap: () => onTabSelected(2),
            ),
            BottomNavTile(
              index: 3,
              selectedIndex: selectedTab,
              label: "Settings",
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
                fontFamily: "PlusJakartaSans",
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
