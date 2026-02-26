import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/login/notifier/login_notifier.dart';
import 'package:hrms_mobile/src/settings/view/webview_screen.dart';
import 'package:hrms_mobile/utils/common_widgets/common_popup.dart';
import 'package:hrms_mobile/utils/routes/route_constants.dart';

import '../../../utils/common_widgets/primary_button.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _showLogoutPopup(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CommonPopup(
        title: 'Logout Confirmation',
        message: 'Are you sure you want to logout from the application?',
        actionButtonText: 'Logout',
        cancelButtonText: 'Cancel',
        onActionPressed: () async {
          return await ref.read(loginProvider.notifier).logout(() {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteConstants.routeLoginScreen,
              (route) => false,
            );
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorPalette.loginBackground.withValues(alpha: 0.05),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                  fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: ColorPalette.loginBackground,
                ),
              ),
              24.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _SettingsOption(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              title: 'Privacy Policy',
                              url: 'https://flutter.dev',
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(
                      height: 1,
                      color: ColorPalette.fE5E7EB,
                      indent: 16.w,
                      endIndent: 16.w,
                    ),
                    _SettingsOption(
                      icon: Icons.description_outlined,
                      title: 'Terms and Conditions',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              title: 'Terms and Conditions',
                              url: 'https://flutter.dev',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                buttonText: 'Logout',
                onPressed: () => _showLogoutPopup(context, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: ColorPalette.primaryColor, size: 24.sp),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorPalette.loginBackground,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: ColorPalette.fB0B0B0,
        size: 20.sp,
      ),
    );
  }
}
