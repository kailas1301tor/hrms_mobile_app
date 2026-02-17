import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/src/main/view/main_screen.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h),
      child: PrimaryButton(
        buttonText: 'SIGN IN TO SYSTEM',
        isLoading: false,
        onPressed: () {
          // Handle login logic here
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        },
      ),
    );
  }
}
