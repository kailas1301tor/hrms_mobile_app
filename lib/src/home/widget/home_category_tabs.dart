import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../res/constants/string_constants.dart';
import '../../../res/styles/color_palette.dart';

class HomeCategoryTabs extends StatelessWidget {
  const HomeCategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      Strings.asia,
      Strings.europe,
      Strings.southAmerica,
      Strings.northAmerica,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: categories.map((category) {
          final isSelected = category == Strings.southAmerica;
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: ShapeDecoration(
                color: isSelected ? ColorPalette.f212529 : ColorPalette.white,
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  smoothness: 0.6,
                ),
              ),
              child: Text(category),
            ),
          );
        }).toList(),
      ),
    );
  }
}
