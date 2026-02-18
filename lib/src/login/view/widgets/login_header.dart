import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/generated/assets.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.pngLogo, width: 80.w, fit: BoxFit.contain),
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
