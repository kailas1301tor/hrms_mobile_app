import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CommonPopup extends StatefulWidget {
  final String title;
  final String message;
  final String actionButtonText;
  final FutureOr<void> Function() onActionPressed;
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
  State<CommonPopup> createState() => _CommonPopupState();
}

class _CommonPopupState extends State<CommonPopup> {
  bool _isLoading = false;

  Future<void> _handleAction() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await widget.onActionPressed();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
              widget.title,
              style: PlusJakartaSansFontPalette.base700(
                18,
                color: ColorPalette.f0E0F0C,
              ),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            Text(
              widget.message,
              style: PlusJakartaSansFontPalette.base400(
                14,
                color: ColorPalette.f6D6D6D,
              ),
              textAlign: TextAlign.center,
            ),
            24.verticalSpace,
            Row(
              children: [
                if (widget.cancelButtonText != null) ...[
                  Expanded(
                    child: TextButton(
                      onPressed: _isLoading
                          ? null
                          : widget.onCancelPressed ??
                                () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(
                        widget.cancelButtonText!,
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
                    onPressed: _isLoading ? null : _handleAction,
                    buttonText: widget.actionButtonText,
                    height: 50.h,
                    isLoading: _isLoading,
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
