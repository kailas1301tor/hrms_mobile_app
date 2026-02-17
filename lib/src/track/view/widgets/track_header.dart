import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:smooth_corner/smooth_corner.dart';

class TrackHeader extends StatelessWidget {
  const TrackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('My Filings', style: PlusJakartaSansFontPalette.f0E0F0C_32_700),
          SmoothContainer(
            smoothness: 2,
            borderRadius: BorderRadius.circular(20.r),
            color: ColorPalette.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Text(
              'NEW ENTRY',
              style: PlusJakartaSansFontPalette.base700(
                13,
                color: ColorPalette.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
