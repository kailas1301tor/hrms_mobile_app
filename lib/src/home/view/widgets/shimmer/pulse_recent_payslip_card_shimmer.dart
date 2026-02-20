import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../../../../../res/styles/color_palette.dart';

class PulseRecentPayslipCardShimmer extends StatelessWidget {
  const PulseRecentPayslipCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(30.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      padding: EdgeInsets.all(20.r),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
          ).showGradientShimmer(borderRadius: 16.r),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ).showGradientShimmer(),
                4.verticalSpace,
                Container(
                  width: 80.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ).showGradientShimmer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
