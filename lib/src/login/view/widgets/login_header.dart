import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:smooth_corner/smooth_corner.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmoothContainer(
          width: 80.w,
          height: 80.w,
          smoothness: 2,
          borderRadius: BorderRadius.circular(20.r),
          color: ColorPalette.primaryColor,
          child: Center(
            child: Icon(
              Icons.business_center_outlined,
              color: ColorPalette.white,
              size: 40.w,
            ),
          ),
        ),
        24.verticalSpace,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Nexus',
                style: PlusJakartaSansFontPalette.base700(
                  28,
                  color: ColorPalette.primaryColorDark,
                ),
              ),
              TextSpan(
                text: 'HRM',
                style: PlusJakartaSansFontPalette.base700(
                  28,
                  color: const Color(0xFFE30000),
                ),
              ),
            ],
          ),
        ),
        8.verticalSpace,
        Text(
          'AUTHORIZED ACCESS ONLY',
          style: PlusJakartaSansFontPalette.base600(
            12,
            color: ColorPalette.f6C7278,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
