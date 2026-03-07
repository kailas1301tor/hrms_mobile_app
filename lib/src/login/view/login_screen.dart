import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/app_theme.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/login/view/widgets/login_button.dart';
import 'package:hrms_mobile/src/login/view/widgets/login_form.dart';
import 'package:hrms_mobile/src/login/view/widgets/login_header.dart';
import 'package:hrms_mobile/src/settings/view/webview_screen.dart';
import 'package:hrms_mobile/utils/common_widgets/system_ui_style_wrapper.dart';
import 'package:smooth_corner/smooth_corner.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SystemUiStyleWrapper(
      style: AppTheme.systemOverlayStyleDark,
      child: Scaffold(
        backgroundColor: ColorPalette.loginBackground,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothContainer(
                  smoothness: 2.0,
                  borderRadius: BorderRadius.circular(20.r),
                  color: ColorPalette.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 30.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LoginHeader(),
                      const LoginForm(),
                      const LoginButton(),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              title: 'Privacy Policy',
                              url: 'https://www.google.com/',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontFamily:
                              PlusJakartaSansFontPalette.plusJakartaSansFamily,
                          fontSize: 12.sp,
                          color: ColorPalette.white,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: const BoxDecoration(
                        color: ColorPalette.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              title: 'Terms and Conditions',
                              url: 'https://www.google.com/',
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontFamily:
                              PlusJakartaSansFontPalette.plusJakartaSansFamily,
                          fontSize: 12.sp,
                          color: ColorPalette.white,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
