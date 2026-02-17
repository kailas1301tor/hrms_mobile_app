import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'primary_button.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmButtonColor;
  final String? icon;
  final bool isLoading;

  const CustomBottomSheetWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.confirmButtonColor,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              width: 35.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE7E7E7),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            if (icon != null) 32.verticalSpace,
            if (icon != null) SvgPicture.asset(icon!),
            23.verticalSpace,
            Text(
              title,
              style: PlusJakartaSansFontPalette.f0E0F0C_25_600,
              textAlign: TextAlign.center,
            ),
            8.verticalSpace,
            Text(
              subTitle,
              style: PlusJakartaSansFontPalette.f0E0F0C_14_400,
              textAlign: TextAlign.center,
            ),
            30.verticalSpace,
            PrimaryButton(
              isLoading: isLoading,
              onPressed: onConfirm,
              buttonText: confirmText ?? 'Yes, Confirm',
              color: confirmButtonColor ?? ColorPalette.primaryColor,
              textStyle: PlusJakartaSansFontPalette.fWhite_16_600,
            ),
            16.verticalSpace,
            PrimaryButton(
              onPressed: onCancel ?? () => Navigator.pop(context),
              buttonText: cancelText ?? 'Cancel',
              color: ColorPalette.transparent,
              textStyle: PlusJakartaSansFontPalette.f1B351F_16_600,
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
