// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_pulse_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StaffPulseNotifier)
const staffPulseProvider = StaffPulseNotifierProvider._();

final class StaffPulseNotifierProvider
    extends $NotifierProvider<StaffPulseNotifier, StaffPulseState> {
  const StaffPulseNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffPulseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffPulseNotifierHash();

  @$internal
  @override
  StaffPulseNotifier create() => StaffPulseNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StaffPulseState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StaffPulseState>(value),
    );
  }
}

String _$staffPulseNotifierHash() =>
    r'48d4142fb5a907e117aa3ccb8acdb25d17249048';

abstract class _$StaffPulseNotifier extends $Notifier<StaffPulseState> {
  StaffPulseState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StaffPulseState, StaffPulseState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StaffPulseState, StaffPulseState>,
              StaffPulseState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
