import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/tour_model.dart';
import '../model/trip_model.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool buttonLoader,
  }) = _HomeState;
}
