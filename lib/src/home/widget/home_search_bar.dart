import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_corner/smooth_corner.dart';

import '../../../res/constants/string_constants.dart';
import '../../../res/styles/color_palette.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        decoration: ShapeDecoration(
          color: ColorPalette.white,
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            smoothness: 0.6,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: ColorPalette.f212529, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: Strings.searchPlaceholder,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  fillColor: Colors.transparent,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: const BoxDecoration(
                color: ColorPalette.f212529,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.tune, color: ColorPalette.white, size: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
