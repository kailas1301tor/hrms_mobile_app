import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class AdminRegionalPresenceCard extends StatelessWidget {
  const AdminRegionalPresenceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      smoothness: 2,
      borderRadius: BorderRadius.circular(24.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.pie_chart_outline_rounded,
                color: ColorPalette.fFF2727,
                size: 20.sp,
              ),
              8.horizontalSpace,
              Text(
                "REGIONAL PRESENCE",
                style: PlusJakartaSansFontPalette.base700(
                  12,
                  color: ColorPalette.f101828,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          24.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _RegionProgressItem(label: "DUBAI HQ", percentage: 0.82),
              ),
              16.horizontalSpace,
              Expanded(
                child: _RegionProgressItem(
                  label: "ABU DHABI",
                  percentage: 0.82,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _RegionProgressItem(label: "SHARJAH", percentage: 0.82),
              ),
              16.horizontalSpace,
              Expanded(
                child: _RegionProgressItem(label: "AJMAN", percentage: 0.82),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RegionProgressItem extends StatelessWidget {
  final String label;
  final double percentage;

  const _RegionProgressItem({required this.label, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: PlusJakartaSansFontPalette.base700(
                10,
                color: ColorPalette.coolGray,
                letterSpacing: 1.0,
              ),
            ),
            Text(
              "${(percentage * 100).toInt()}%",
              style: PlusJakartaSansFontPalette.base700(
                12,
                color: ColorPalette.primaryColor,
              ),
            ),
          ],
        ),
        8.verticalSpace,
        LinearProgressIndicator(
          value: percentage,
          backgroundColor: ColorPalette.fF0F0F0,
          valueColor: const AlwaysStoppedAnimation<Color>(
            ColorPalette.primaryColor,
          ),
          minHeight: 8.h,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ],
    );
  }
}
