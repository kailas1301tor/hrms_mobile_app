// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_requests_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdminRequestsNotifier)
const adminRequestsProvider = AdminRequestsNotifierProvider._();

final class AdminRequestsNotifierProvider
    extends $NotifierProvider<AdminRequestsNotifier, AdminRequestsState> {
  const AdminRequestsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminRequestsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminRequestsNotifierHash();

  @$internal
  @override
  AdminRequestsNotifier create() => AdminRequestsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AdminRequestsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AdminRequestsState>(value),
    );
  }
}

String _$adminRequestsNotifierHash() =>
    r'5942063b749dc2d5d69c4daf374e65f02b074cd7';

abstract class _$AdminRequestsNotifier extends $Notifier<AdminRequestsState> {
  AdminRequestsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AdminRequestsState, AdminRequestsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AdminRequestsState, AdminRequestsState>,
              AdminRequestsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
