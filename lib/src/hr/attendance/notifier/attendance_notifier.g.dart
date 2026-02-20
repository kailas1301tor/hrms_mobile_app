// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HrAttendanceNotifier)
const hrAttendanceProvider = HrAttendanceNotifierProvider._();

final class HrAttendanceNotifierProvider
    extends $NotifierProvider<HrAttendanceNotifier, HrAttendanceState> {
  const HrAttendanceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hrAttendanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hrAttendanceNotifierHash();

  @$internal
  @override
  HrAttendanceNotifier create() => HrAttendanceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HrAttendanceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HrAttendanceState>(value),
    );
  }
}

String _$hrAttendanceNotifierHash() =>
    r'444b4fa14170004da1123b7e7fb1853774541eb2';

abstract class _$HrAttendanceNotifier extends $Notifier<HrAttendanceState> {
  HrAttendanceState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HrAttendanceState, HrAttendanceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HrAttendanceState, HrAttendanceState>,
              HrAttendanceState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
