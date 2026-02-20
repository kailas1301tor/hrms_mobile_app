import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../../res/styles/color_palette.dart';

class PulseRecentActivitiesShimmer extends StatelessWidget {
  const PulseRecentActivitiesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Shimmer
        Container(
          width: 120.w,
          height: 14.h,
          decoration: BoxDecoration(
            color: ColorPalette.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ).showGradientShimmer(),
        16.verticalSpace,
        // List Items Shimmer
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 3, // Show 3 shimmer items
          separatorBuilder: (context, index) => 12.verticalSpace,
          itemBuilder: (context, index) => const _ActivityShimmerCard(),
        ),
      ],
    );
  }
}

class _ActivityShimmerCard extends StatelessWidget {
  const _ActivityShimmerCard();

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
          // Icon Shimmer
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ).showGradientShimmer(borderRadius: 12.r),
          16.horizontalSpace,
          // Text Column Shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
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
          // Status Badge Shimmer
          Container(
            width: 70.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ).showGradientShimmer(borderRadius: 8.r),
        ],
      ),
    );
  }
}
