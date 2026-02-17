import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:smooth_corner/smooth_corner.dart';

class FilingTabSelector extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const FilingTabSelector({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(24.r),
      color: ColorPalette.white.withValues(alpha: 0.5),
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 24.h),
      side: const BorderSide(color: ColorPalette.fF0F0F0),
      child: Row(
        children: [
          _buildTab('LEAVE', 0),
          _buildTab('ADVANCE', 1),
          _buildTab('LOAN', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabSelected(index),
        child: SmoothContainer(
          smoothness: 2,
          borderRadius: BorderRadius.circular(16.r),
          color: isSelected ? ColorPalette.primaryColor : Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Center(
            child: Text(
              label,
              style: PlusJakartaSansFontPalette.base700(
                13,
                color: isSelected ? ColorPalette.white : ColorPalette.f99A1AF,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
