import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class AdminRequestTabBar extends StatelessWidget {
  final String selectedTab;
  final Function(String) onTabChanged;

  const AdminRequestTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ["LEAVE", "ADVANCE", "LOAN"];

    return SmoothContainer(
      padding: EdgeInsets.all(8.w),
      smoothness: 2,
      borderRadius: BorderRadius.circular(16.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = selectedTab == tab;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(tab),
              child: SmoothContainer(
                smoothness: 2,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                color: isSelected
                    ? ColorPalette.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12.r),
                alignment: Alignment.center,
                child: Text(
                  tab,
                  style: PlusJakartaSansFontPalette.base700(
                    12,
                    color: isSelected
                        ? ColorPalette.white
                        : ColorPalette.f6C7278,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
