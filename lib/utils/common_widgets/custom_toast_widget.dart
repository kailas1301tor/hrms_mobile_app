import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_mobile/generated/assets.dart';

import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CustomToastWidget extends StatelessWidget {
  const CustomToastWidget({
    super.key,
    required this.message,
    this.link,
    this.isSuccess,
    this.onLinkTap,
    this.increaseBottomPadding,
    this.onClose,
  });

  final String message;
  final String? link;
  final bool? isSuccess;
  final VoidCallback? onLinkTap;
  final bool? increaseBottomPadding;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: (increaseBottomPadding ?? false) ? 70 : 0,
      ),
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(16.w),
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            smoothness: 1,
          ),
          color: (isSuccess ?? false)
              ? ColorPalette.secondaryColor
              : ColorPalette.fFF4C6A,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon and toast message
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSuccess != null) ...[
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: (isSuccess ?? false)
                              ? ColorPalette.white
                              : ColorPalette.fBD1A0F,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            (isSuccess ?? false) ? Icons.check : Icons.error,
                            size: 16.h,
                            color: (isSuccess ?? false)
                                ? ColorPalette.primaryColor
                                : Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                    Flexible(
                      child: Text(
                        message,
                        style: PlusJakartaSansFontPalette.fWhite_14_600,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // link section
            if (link != null) ...[
              Container(
                height: double.infinity,
                width: 1.w,
                color: const Color(0xFF4B4B4B),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                child: GestureDetector(
                  onTap: onLinkTap,
                  child: Text(
                    "Link",
                    style: PlusJakartaSansFontPalette.fWhite_14_600.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],

            if (onClose != null) ...[
              GestureDetector(
                onTap: onClose,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w, left: 8.w),
                  child: SvgPicture.asset(Assets.svgToastError),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
