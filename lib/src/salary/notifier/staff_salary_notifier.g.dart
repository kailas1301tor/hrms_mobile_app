// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_salary_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StaffSalaryNotifier)
const staffSalaryProvider = StaffSalaryNotifierProvider._();

final class StaffSalaryNotifierProvider
    extends $NotifierProvider<StaffSalaryNotifier, StaffSalaryState> {
  const StaffSalaryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffSalaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffSalaryNotifierHash();

  @$internal
  @override
  StaffSalaryNotifier create() => StaffSalaryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StaffSalaryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StaffSalaryState>(value),
    );
  }
}

String _$staffSalaryNotifierHash() =>
    r'14ea4dfed833a4d0885b96d4ea193ca60fdf64b2';

abstract class _$StaffSalaryNotifier extends $Notifier<StaffSalaryState> {
  StaffSalaryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StaffSalaryState, StaffSalaryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StaffSalaryState, StaffSalaryState>,
              StaffSalaryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
