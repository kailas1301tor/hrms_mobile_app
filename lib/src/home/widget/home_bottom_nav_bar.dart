import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../res/styles/color_palette.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const HomeBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: ColorPalette.f212529,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          smoothness: 0.6,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_filled, 0),
          _buildNavItem(Icons.calendar_today_outlined, 1),
          _buildNavItem(Icons.favorite_border, 2),
          _buildNavItem(Icons.grid_view, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onIndexChanged(index),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: isSelected
            ? const BoxDecoration(
                color: ColorPalette.white,
                shape: BoxShape.circle,
              )
            : null,
        child: Icon(
          icon,
          color: isSelected
              ? ColorPalette.f212529
              : Colors.white.withOpacity(0.5),
          size: 24.sp,
        ),
      ),
    );
  }
}
