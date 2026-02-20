// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HrSummaryNotifier)
const hrSummaryProvider = HrSummaryNotifierProvider._();

final class HrSummaryNotifierProvider
    extends $NotifierProvider<HrSummaryNotifier, SummaryState> {
  const HrSummaryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hrSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hrSummaryNotifierHash();

  @$internal
  @override
  HrSummaryNotifier create() => HrSummaryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SummaryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SummaryState>(value),
    );
  }
}

String _$hrSummaryNotifierHash() => r'a632c3a230cd0d696eb858aeaaa3532173f922a3';

abstract class _$HrSummaryNotifier extends $Notifier<SummaryState> {
  SummaryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SummaryState, SummaryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SummaryState, SummaryState>,
              SummaryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
