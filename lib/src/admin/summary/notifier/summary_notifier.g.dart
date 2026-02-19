// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SummaryNotifier)
const summaryProvider = SummaryNotifierProvider._();

final class SummaryNotifierProvider
    extends $NotifierProvider<SummaryNotifier, SummaryState> {
  const SummaryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'summaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$summaryNotifierHash();

  @$internal
  @override
  SummaryNotifier create() => SummaryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SummaryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SummaryState>(value),
    );
  }
}

String _$summaryNotifierHash() => r'cb58a95fa0b322c577661b1b77e607d5b907e337';

abstract class _$SummaryNotifier extends $Notifier<SummaryState> {
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
