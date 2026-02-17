import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/src/login/view/widgets/login_button.dart';
import 'package:hrms_mobile/src/login/view/widgets/login_form.dart';
import 'package:hrms_mobile/src/login/view/widgets/login_header.dart';
import 'package:smooth_corner/smooth_corner.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.loginBackground,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: SmoothContainer(
            smoothness: 2.0,
            borderRadius: BorderRadius.circular(20.r),
            color: ColorPalette.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginHeader(),
                const LoginForm(),
                const LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
