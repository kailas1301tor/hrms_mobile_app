// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginRepository)
const loginRepositoryProvider = LoginRepositoryProvider._();

final class LoginRepositoryProvider
    extends $FunctionalProvider<LoginRepo, LoginRepo, LoginRepo>
    with $Provider<LoginRepo> {
  const LoginRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginRepositoryHash();

  @$internal
  @override
  $ProviderElement<LoginRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginRepo create(Ref ref) {
    return loginRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginRepo>(value),
    );
  }
}

String _$loginRepositoryHash() => r'77bfcebce7e9f15f240de32e2f6377d8be804e68';
