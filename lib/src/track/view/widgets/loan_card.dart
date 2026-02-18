import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';

class LoanCard extends StatelessWidget {
  const LoanCard({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PERSONAL LOAN',
                style: PlusJakartaSansFontPalette.base700(
                  12,
                  color: Color(0XFF1D5BFE),
                  letterSpacing: 1.2,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0XFFFCF3F1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'REJECTED',
                  style: PlusJakartaSansFontPalette.base700(
                    11,
                    color: const Color(0XFFBD1A0F),
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            '${AppConstants.currency} 20,000.00',
            style: PlusJakartaSansFontPalette.base700(
              20,
              color: ColorPalette.primaryColorDark,
            ),
          ),
          20.verticalSpace,
          Divider(color: ColorPalette.fF0F0F0, thickness: 1.h),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REFERENCE #L-909',
                style: PlusJakartaSansFontPalette.base700(
                  11,
                  color: ColorPalette.f99A1AF,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                '2024-05-10',
                style: PlusJakartaSansFontPalette.base700(
                  11,
                  color: ColorPalette.f99A1AF,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
