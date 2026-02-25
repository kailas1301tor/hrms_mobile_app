import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:hrms_mobile/data/local/sembast_services.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import 'package:hrms_mobile/res/constants/string_constants.dart';
import 'package:hrms_mobile/services/repo_di.dart';
import 'package:hrms_mobile/src/login/repo/login_repo.dart';
import 'package:hrms_mobile/src/login/state/login_state.dart';
import 'package:hrms_mobile/utils/helpers/common_functions.dart';
import 'package:hrms_mobile/utils/helpers/validators.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_notifier.g.dart';

@Riverpod(name: 'loginProvider')
class LoginNotifier extends _$LoginNotifier {
  LoginRepo get loginRepo => ref.read(loginRepositoryProvider);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  LoginState build() {
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);

    ref.onDispose(() {
      emailController.removeListener(_updateButtonState);
      passwordController.removeListener(_updateButtonState);
      emailController.dispose();
      passwordController.dispose();
    });

    return const LoginState();
  }

  void _updateButtonState() {
    final isValid =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    if (state.isButtonActive != isValid) {
      state = state.copyWith(isButtonActive: isValid);
    }
  }

  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  bool validateFields() {
    final emailError = Validators.validateUserName(emailController.text);
    final passwordError = Validators.validatePassword(passwordController.text);

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
    );

    return emailError == null && passwordError == null;
  }

  Future<void> login(Function(String?, String?) onSuccess) async {
    if (!validateFields()) return;

    state = state.copyWith(
      isLoading: true,
      emailError: null,
      passwordError: null,
    );

    loginRepo
        .login(emailController.text, passwordController.text)
        .fold(
          (error) {
            state = state.copyWith(isLoading: false);
            showCustomToast(
              message: error.message ?? Strings.loginFailed,
              isSuccess: false,
            );
          },
          (response) async {
            state = state.copyWith(isLoading: false);
            if (response.token != null) {
              AppConstants.accessToken = response.token!;
              final sembast = ref.read(sembastServicesProvider);
              await sembast.saveTokens(accessToken: response.token!);
              await sembast.saveLoginResponse(response);
            }
            onSuccess(response.role, response.user?.name);
          },
        )
        .catchError((error) {
          state = state.copyWith(isLoading: false);
          debugPrint(error.toString());
        });
  }

  Future<void> logout(VoidCallback onDone) async {
    // Capture refs before async gap
    final sembast = ref.read(sembastServicesProvider);
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true);

    await loginRepo
        .logout()
        .then((result) {
          result.fold(
            (error) {
              if (ref.mounted) state = state.copyWith(isLoading: false);
              debugPrint(error.toString());
              _clearLocalAndLogout(onDone, sembast);
            },
            (response) {
              if (ref.mounted) state = state.copyWith(isLoading: false);
              debugPrint(response.toString());
              _clearLocalAndLogout(onDone, sembast);
              showCustomToast(
                message: response['message'] ?? "Logged out successfully",
                isSuccess: true,
              );
            },
          );
        })
        .catchError((error) {
          if (ref.mounted) state = state.copyWith(isLoading: false);
          debugPrint(error.toString());
          _clearLocalAndLogout(onDone, sembast);
        });
  }

  Future<void> _clearLocalAndLogout(
    VoidCallback onDone,
    SembastServices sembast,
  ) async {
    AppConstants.accessToken = "";
    await sembast.clearSembastDb();
    onDone();
  }
}
