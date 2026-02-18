import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isButtonActive,
    @Default(true) bool isPasswordVisible,
    String? emailError,
    String? passwordError,
  }) = _LoginState;
}
