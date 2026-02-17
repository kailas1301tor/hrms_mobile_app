// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
const homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepo, HomeRepo, HomeRepo>
    with $Provider<HomeRepo> {
  const HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepo create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepo>(value),
    );
  }
}

String _$homeRepositoryHash() => r'4c5ad2ec9bdc4494ccb0676509b2300718d3f2b8';
