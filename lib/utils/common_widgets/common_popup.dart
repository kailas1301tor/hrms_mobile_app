import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CommonPopup extends StatelessWidget {
  final String title;
  final String message;
  final String actionButtonText;
  final VoidCallback onActionPressed;
  final String? cancelButtonText;
  final VoidCallback? onCancelPressed;

  const CommonPopup({
    super.key,
    required this.title,
    required this.message,
    required this.actionButtonText,
    required this.onActionPressed,
    this.cancelButtonText,
    this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SmoothContainer(
        smoothness: 2,
        borderRadius: BorderRadius.circular(30.r),
        color: ColorPalette.white,
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: PlusJakartaSansFontPalette.base700(
                18,
                color: ColorPalette.f0E0F0C,
              ),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            Text(
              message,
              style: PlusJakartaSansFontPalette.base400(
                14,
                color: ColorPalette.f6D6D6D,
              ),
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,
            Row(
              children: [
                if (cancelButtonText != null) ...[
                  Expanded(
                    child: TextButton(
                      onPressed:
                          onCancelPressed ?? () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(
                        cancelButtonText!,
                        style: PlusJakartaSansFontPalette.base600(
                          16,
                          color: ColorPalette.f6D6D6D,
                        ),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                ],
                Expanded(
                  child: PrimaryButton(
                    onPressed: onActionPressed,
                    buttonText: actionButtonText,
                    height: 50.h,
                    color: ColorPalette.fE53B40, // Red for logout/danger
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
