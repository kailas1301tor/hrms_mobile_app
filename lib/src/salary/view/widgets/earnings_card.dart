import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:smooth_corner/smooth_corner.dart';

class EarningsCard extends StatelessWidget {
  final String monthYear;
  final String amount;

  const EarningsCard({
    super.key,
    required this.monthYear,
    required this.amount,
  });

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
      padding: EdgeInsets.all(24.w),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          SmoothContainer(
            width: 56.w,
            height: 56.w,
            smoothness: 2,
            borderRadius: BorderRadius.circular(16.r),
            color: const Color(0XFFF8F9FB),
            child: Center(
              child: Icon(
                Icons.file_download_outlined,
                color: ColorPalette.primaryColorDark,
                size: 24.w,
              ),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  monthYear,
                  style: PlusJakartaSansFontPalette.base700(
                    14,
                    color: ColorPalette.primaryColorDark,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'NEXUS PAYROLL DISBURSED',
                  style: PlusJakartaSansFontPalette.base700(
                    10,
                    color: ColorPalette.f99A1AF,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: PlusJakartaSansFontPalette.base700(
              16,
              color: ColorPalette.primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
