import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_mobile/generated/assets.dart';
import 'package:hrms_mobile/res/constants/string_constants.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';

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
