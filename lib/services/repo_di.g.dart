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

@ProviderFor(summaryRepository)
const summaryRepositoryProvider = SummaryRepositoryProvider._();

final class SummaryRepositoryProvider
    extends $FunctionalProvider<SummaryRepo, SummaryRepo, SummaryRepo>
    with $Provider<SummaryRepo> {
  const SummaryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'summaryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$summaryRepositoryHash();

  @$internal
  @override
  $ProviderElement<SummaryRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SummaryRepo create(Ref ref) {
    return summaryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SummaryRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SummaryRepo>(value),
    );
  }
}

String _$summaryRepositoryHash() => r'41821371677933561b2268fde141d2dda1312936';

@ProviderFor(attendanceRepository)
const attendanceRepositoryProvider = AttendanceRepositoryProvider._();

final class AttendanceRepositoryProvider
    extends $FunctionalProvider<AttendanceRepo, AttendanceRepo, AttendanceRepo>
    with $Provider<AttendanceRepo> {
  const AttendanceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'attendanceRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$attendanceRepositoryHash();

  @$internal
  @override
  $ProviderElement<AttendanceRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AttendanceRepo create(Ref ref) {
    return attendanceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AttendanceRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AttendanceRepo>(value),
    );
  }
}

String _$attendanceRepositoryHash() =>
    r'6b7cc9179a89a0534bb058822894c3aa3e3bb951';
