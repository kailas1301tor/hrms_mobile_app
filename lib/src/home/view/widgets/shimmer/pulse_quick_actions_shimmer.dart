import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../../res/styles/color_palette.dart';

class PulseQuickActionsShimmer extends StatelessWidget {
  const PulseQuickActionsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildShimmerItem()),
        12.horizontalSpace,
        Expanded(child: _buildShimmerItem()),
        12.horizontalSpace,
        Expanded(child: _buildShimmerItem()),
      ],
    );
  }

  Widget _buildShimmerItem() {
    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(24.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              shape: BoxShape.circle,
            ),
          ).showGradientShimmer(borderRadius: 50.r),
          16.verticalSpace,
          Container(
            width: 60.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ).showGradientShimmer(),
        ],
      ),
    );
  }
}
