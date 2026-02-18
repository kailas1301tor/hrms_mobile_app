import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class PulseHeaderCard extends StatelessWidget {
  const PulseHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      smoothness: 2,
      borderRadius: BorderRadius.circular(36.r),
      color: ColorPalette.primaryColor,
      child: Stack(
        children: [
          // Decoration Circle
          Positioned(
            right: -50.w,
            top: -50.h,
            child: Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPalette.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CHECK-IN STATUS",
                  style: PlusJakartaSansFontPalette.base700(
                    11,
                    color: ColorPalette.white.withValues(alpha: 0.6),
                    letterSpacing: 1.2,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: const BoxDecoration(
                        color: ColorPalette.f1CB42F,
                        shape: BoxShape.circle,
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        "On-Duty Today",
                        style: PlusJakartaSansFontPalette.fWhite_28_700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CHECK-IN TIME",
                            style: PlusJakartaSansFontPalette.base700(
                              11,
                              color: ColorPalette.white.withValues(alpha: 0.6),
                              letterSpacing: 1.2,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            "08:15 AM",
                            style: PlusJakartaSansFontPalette.fWhite_20_600,
                            overflow: TextOverflow.ellipsis,
                          ),
                          4.verticalSpace,
                          Text(
                            "15M LATE ENTRY.",
                            style: PlusJakartaSansFontPalette.base700(
                              11,
                              color: ColorPalette.fFF7C34,
                              letterSpacing: 0.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
