import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? borderColor;
  final Color? checkColor;
  final double? size;
  final double? borderRadius;

  const CustomCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.borderColor,
    this.checkColor,
    this.size,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final checkboxSize = size ?? 19.w;
    final effectiveActiveColor = activeColor ?? ColorPalette.primaryColor;
    final effectiveBorderColor = borderColor ?? const Color(0XFF6C7278);
    final effectiveCheckColor = checkColor ?? ColorPalette.white;

    return InkWell(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: checkboxSize,
        height: checkboxSize,
        decoration: ShapeDecoration(
          color: value ? effectiveActiveColor : ColorPalette.white,
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 2.r),
            smoothness: 0.6,
            side: BorderSide(
              color: value ? effectiveActiveColor : effectiveBorderColor,
              width: 1.5.w,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: checkboxSize * 0.7,
                color: effectiveCheckColor,
              )
            : null,
      ),
    );
  }
}
