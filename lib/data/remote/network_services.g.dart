// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(networkServices)
const networkServicesProvider = NetworkServicesProvider._();

final class NetworkServicesProvider
    extends
        $FunctionalProvider<NetworkServices, NetworkServices, NetworkServices>
    with $Provider<NetworkServices> {
  const NetworkServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkServicesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkServicesHash();

  @$internal
  @override
  $ProviderElement<NetworkServices> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkServices create(Ref ref) {
    return networkServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkServices>(value),
    );
  }
}

String _$networkServicesHash() => r'60bc7d982ce1fee5f53198c2c64d4eb7f80ac5b1';
