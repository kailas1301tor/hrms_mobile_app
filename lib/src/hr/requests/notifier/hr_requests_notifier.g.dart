// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hr_requests_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HrRequestsNotifier)
const hrRequestsProvider = HrRequestsNotifierProvider._();

final class HrRequestsNotifierProvider
    extends $NotifierProvider<HrRequestsNotifier, HrRequestsState> {
  const HrRequestsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hrRequestsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hrRequestsNotifierHash();

  @$internal
  @override
  HrRequestsNotifier create() => HrRequestsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HrRequestsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HrRequestsState>(value),
    );
  }
}

String _$hrRequestsNotifierHash() =>
    r'4ff333077439102032e8f06fa66cbc202aec2cc9';

abstract class _$HrRequestsNotifier extends $Notifier<HrRequestsState> {
  HrRequestsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HrRequestsState, HrRequestsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HrRequestsState, HrRequestsState>,
              HrRequestsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
