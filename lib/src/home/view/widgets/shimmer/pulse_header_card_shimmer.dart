import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../../../res/styles/color_palette.dart';

class PulseHeaderCardShimmer extends StatelessWidget {
  const PulseHeaderCardShimmer({super.key});

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
                Container(
                  width: 100.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ).showGradientShimmer(),
                24.verticalSpace,
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        color: ColorPalette.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                    ).showGradientShimmer(),
                    8.horizontalSpace,
                    Expanded(
                      child: Container(
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: ColorPalette.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ).showGradientShimmer(),
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
                          Container(
                            width: 80.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: ColorPalette.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ).showGradientShimmer(),
                          4.verticalSpace,
                          Container(
                            width: 120.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: ColorPalette.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ).showGradientShimmer(),
                          4.verticalSpace,
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
