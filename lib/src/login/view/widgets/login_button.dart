import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/src/login/notifier/login_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';
import 'package:hrms_mobile/utils/routes/route_constants.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    return Padding(
      padding: EdgeInsets.only(top: 32.h),
      child: PrimaryButton(
        buttonText: 'SIGN IN TO SYSTEM',
        isLoading: loginState.isLoading,
        onPressed: () {
          ref.read(loginProvider.notifier).login((role) {
            _navigateToMainScreen(role, context);
          });
        },
      ),
    );
  }

  void _navigateToMainScreen(String? role, BuildContext context) {
    if (role?.toLowerCase() == 'admin') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteConstants.routeAdminMainScreen,
        (route) => false,
      );
    } else if (role?.toLowerCase() == 'employee') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteConstants.routeMainScreen,
        (route) => false,
      );
    }
  }
}
