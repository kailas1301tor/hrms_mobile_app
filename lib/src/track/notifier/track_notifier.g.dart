// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TrackNotifier)
const trackProvider = TrackNotifierProvider._();

final class TrackNotifierProvider
    extends $NotifierProvider<TrackNotifier, TrackState> {
  const TrackNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trackProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trackNotifierHash();

  @$internal
  @override
  TrackNotifier create() => TrackNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TrackState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TrackState>(value),
    );
  }
}

String _$trackNotifierHash() => r'63eaa517977b2da3e42dcea03a316e124e56f804';

abstract class _$TrackNotifier extends $Notifier<TrackState> {
  TrackState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TrackState, TrackState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TrackState, TrackState>,
              TrackState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
