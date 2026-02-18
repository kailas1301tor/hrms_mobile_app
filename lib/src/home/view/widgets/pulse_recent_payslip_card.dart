import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class PulseRecentPayslipCard extends StatelessWidget {
  const PulseRecentPayslipCard({super.key});

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
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: ColorPalette.fF6F6F6,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.description_outlined,
              color: ColorPalette.primaryColor,
              size: 24.sp,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "May Payslip",
                  style: PlusJakartaSansFontPalette.fBlack_16_700,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  "DISBURSED SUCCESSFULLY",
                  style: PlusJakartaSansFontPalette.base700(
                    11,
                    color: ColorPalette.f1CB42F,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: ColorPalette.fD1D1D1, size: 24.sp),
        ],
      ),
    );
  }
}
