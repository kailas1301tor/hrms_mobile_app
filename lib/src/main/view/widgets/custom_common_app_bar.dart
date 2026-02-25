import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import '../../../../generated/assets.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class CustomCommonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  const CustomCommonAppBar({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10.h,
        left: 20.w,
        right: 20.w,
        bottom: 10.w,
      ),
      decoration: BoxDecoration(
        color: ColorPalette.white,
        border: Border(
          bottom: BorderSide(
            color: ColorPalette.fE5E7EB.withValues(alpha: 0.5),
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo Container
          SizedBox(
            width: 44.w,
            height: 44.w,
            child: Image.asset(
              Assets.pngLogo,
              width: 44.w,
              fit: BoxFit.contain,
            ),
          ),
          12.horizontalSpace,
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? AppConstants.user,
                  style: TextStyle(
                    fontFamily:
                        PlusJakartaSansFontPalette.plusJakartaSansFamily,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: ColorPalette.loginBackground,
                  ),
                ),
                Text(
                  subtitle ?? "STAFF ENTRY",
                  style: TextStyle(
                    fontFamily:
                        PlusJakartaSansFontPalette.plusJakartaSansFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.f99A1AF,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          // User Avatar
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorPalette.primaryColor, width: 1.w),
            ),
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: ColorPalette.primaryColor.withValues(alpha: 0.1),
              child: Text(
                _getInitial(),
                style: TextStyle(
                  fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.primaryColor,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getInitial() {
    if (AppConstants.user.isEmpty) {
      if (title != null && title!.isNotEmpty) {
        return title!.substring(0, 1);
      }
      return "";
    }
    return AppConstants.user.substring(0, 1);
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
