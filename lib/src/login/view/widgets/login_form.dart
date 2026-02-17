import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/common_widgets/normal_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.verticalSpace,
        CommonTextFormField(
          controller: _usernameController,
          hintText: 'enter username',
          prefix: Icon(
            Icons.person_outline,
            color: const Color(0XFFACB5BB),
            size: 20.w,
          ),
        ),
        16.verticalSpace,
        CommonTextFormField(
          controller: _passwordController,
          hintText: 'enter password',
          isObscure: true,
          prefix: Icon(
            Icons.lock_outline,
            color: const Color(0XFFACB5BB),
            size: 20.w,
          ),
        ),
      ],
    );
  }
}
