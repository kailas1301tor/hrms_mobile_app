import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/src/login/notifier/login_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/normal_text_form_field.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);

    return Column(
      children: [
        32.verticalSpace,
        CommonTextFormField(
          controller: notifier.emailController,
          hintText: 'enter user name',
          maxLength: 50,
          errorText: state.emailError,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          prefix: Icon(
            Icons.person_outline,
            color: const Color(0XFFACB5BB),
            size: 20.w,
          ),
          onChanged: (value) {
            if (state.emailError != null) {
              // Optionally verify email on change if needed, or just clear error
            }
          },
        ),
        16.verticalSpace,
        CommonTextFormField(
          controller: notifier.passwordController,
          hintText: 'enter password',
          isObscure: true,
          errorText: state.passwordError,
          maxLength: 50,
          prefix: Icon(
            Icons.lock_outline,
            color: const Color(0XFFACB5BB),
            size: 20.w,
          ),
          onChanged: (value) {
            if (state.passwordError != null) {
              // Optionally clear error
            }
          },
        ),
      ],
    );
  }
}
