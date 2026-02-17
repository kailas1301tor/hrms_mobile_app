// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sembast_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sembastServices)
const sembastServicesProvider = SembastServicesProvider._();

final class SembastServicesProvider
    extends
        $FunctionalProvider<
          AsyncValue<SembastServices>,
          SembastServices,
          FutureOr<SembastServices>
        >
    with $FutureModifier<SembastServices>, $FutureProvider<SembastServices> {
  const SembastServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sembastServicesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sembastServicesHash();

  @$internal
  @override
  $FutureProviderElement<SembastServices> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SembastServices> create(Ref ref) {
    return sembastServices(ref);
  }
}

String _$sembastServicesHash() => r'dfe48ecbd77f46fa7f5166f4240e0d06ea547f8c';
