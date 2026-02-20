// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hr_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HrRequestsState {

 String get selectedTab; List<LeaveRequestItem> get leaveRequests; List<SalaryAdvanceRequestItem> get advanceRequests; List<LoanRequestItem> get loanRequests; LoaderState get leaveLoaderState; LoaderState get advanceLoaderState; LoaderState get loanLoaderState; int get leavePage; int get advancePage; int get loanPage; int? get leaveTotalPages; int? get advanceTotalPages; int? get loanTotalPages; bool get leaveLoadingMore; bool get advanceLoadingMore; bool get loanLoadingMore; bool get actionLoader; String? get interestRateError; String? get repaymentPeriodError; String? get rejectionReasonError;
/// Create a copy of HrRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HrRequestsStateCopyWith<HrRequestsState> get copyWith => _$HrRequestsStateCopyWithImpl<HrRequestsState>(this as HrRequestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HrRequestsState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other.leaveRequests, leaveRequests)&&const DeepCollectionEquality().equals(other.advanceRequests, advanceRequests)&&const DeepCollectionEquality().equals(other.loanRequests, loanRequests)&&(identical(other.leaveLoaderState, leaveLoaderState) || other.leaveLoaderState == leaveLoaderState)&&(identical(other.advanceLoaderState, advanceLoaderState) || other.advanceLoaderState == advanceLoaderState)&&(identical(other.loanLoaderState, loanLoaderState) || other.loanLoaderState == loanLoaderState)&&(identical(other.leavePage, leavePage) || other.leavePage == leavePage)&&(identical(other.advancePage, advancePage) || other.advancePage == advancePage)&&(identical(other.loanPage, loanPage) || other.loanPage == loanPage)&&(identical(other.leaveTotalPages, leaveTotalPages) || other.leaveTotalPages == leaveTotalPages)&&(identical(other.advanceTotalPages, advanceTotalPages) || other.advanceTotalPages == advanceTotalPages)&&(identical(other.loanTotalPages, loanTotalPages) || other.loanTotalPages == loanTotalPages)&&(identical(other.leaveLoadingMore, leaveLoadingMore) || other.leaveLoadingMore == leaveLoadingMore)&&(identical(other.advanceLoadingMore, advanceLoadingMore) || other.advanceLoadingMore == advanceLoadingMore)&&(identical(other.loanLoadingMore, loanLoadingMore) || other.loanLoadingMore == loanLoadingMore)&&(identical(other.actionLoader, actionLoader) || other.actionLoader == actionLoader)&&(identical(other.interestRateError, interestRateError) || other.interestRateError == interestRateError)&&(identical(other.repaymentPeriodError, repaymentPeriodError) || other.repaymentPeriodError == repaymentPeriodError)&&(identical(other.rejectionReasonError, rejectionReasonError) || other.rejectionReasonError == rejectionReasonError));
}


@override
int get hashCode => Object.hashAll([runtimeType,selectedTab,const DeepCollectionEquality().hash(leaveRequests),const DeepCollectionEquality().hash(advanceRequests),const DeepCollectionEquality().hash(loanRequests),leaveLoaderState,advanceLoaderState,loanLoaderState,leavePage,advancePage,loanPage,leaveTotalPages,advanceTotalPages,loanTotalPages,leaveLoadingMore,advanceLoadingMore,loanLoadingMore,actionLoader,interestRateError,repaymentPeriodError,rejectionReasonError]);

@override
String toString() {
  return 'HrRequestsState(selectedTab: $selectedTab, leaveRequests: $leaveRequests, advanceRequests: $advanceRequests, loanRequests: $loanRequests, leaveLoaderState: $leaveLoaderState, advanceLoaderState: $advanceLoaderState, loanLoaderState: $loanLoaderState, leavePage: $leavePage, advancePage: $advancePage, loanPage: $loanPage, leaveTotalPages: $leaveTotalPages, advanceTotalPages: $advanceTotalPages, loanTotalPages: $loanTotalPages, leaveLoadingMore: $leaveLoadingMore, advanceLoadingMore: $advanceLoadingMore, loanLoadingMore: $loanLoadingMore, actionLoader: $actionLoader, interestRateError: $interestRateError, repaymentPeriodError: $repaymentPeriodError, rejectionReasonError: $rejectionReasonError)';
}


}

/// @nodoc
abstract mixin class $HrRequestsStateCopyWith<$Res>  {
  factory $HrRequestsStateCopyWith(HrRequestsState value, $Res Function(HrRequestsState) _then) = _$HrRequestsStateCopyWithImpl;
@useResult
$Res call({
 String selectedTab, List<LeaveRequestItem> leaveRequests, List<SalaryAdvanceRequestItem> advanceRequests, List<LoanRequestItem> loanRequests, LoaderState leaveLoaderState, LoaderState advanceLoaderState, LoaderState loanLoaderState, int leavePage, int advancePage, int loanPage, int? leaveTotalPages, int? advanceTotalPages, int? loanTotalPages, bool leaveLoadingMore, bool advanceLoadingMore, bool loanLoadingMore, bool actionLoader, String? interestRateError, String? repaymentPeriodError, String? rejectionReasonError
});




}
/// @nodoc
class _$HrRequestsStateCopyWithImpl<$Res>
    implements $HrRequestsStateCopyWith<$Res> {
  _$HrRequestsStateCopyWithImpl(this._self, this._then);

  final HrRequestsState _self;
  final $Res Function(HrRequestsState) _then;

/// Create a copy of HrRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? leaveRequests = null,Object? advanceRequests = null,Object? loanRequests = null,Object? leaveLoaderState = null,Object? advanceLoaderState = null,Object? loanLoaderState = null,Object? leavePage = null,Object? advancePage = null,Object? loanPage = null,Object? leaveTotalPages = freezed,Object? advanceTotalPages = freezed,Object? loanTotalPages = freezed,Object? leaveLoadingMore = null,Object? advanceLoadingMore = null,Object? loanLoadingMore = null,Object? actionLoader = null,Object? interestRateError = freezed,Object? repaymentPeriodError = freezed,Object? rejectionReasonError = freezed,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as String,leaveRequests: null == leaveRequests ? _self.leaveRequests : leaveRequests // ignore: cast_nullable_to_non_nullable
as List<LeaveRequestItem>,advanceRequests: null == advanceRequests ? _self.advanceRequests : advanceRequests // ignore: cast_nullable_to_non_nullable
as List<SalaryAdvanceRequestItem>,loanRequests: null == loanRequests ? _self.loanRequests : loanRequests // ignore: cast_nullable_to_non_nullable
as List<LoanRequestItem>,leaveLoaderState: null == leaveLoaderState ? _self.leaveLoaderState : leaveLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,advanceLoaderState: null == advanceLoaderState ? _self.advanceLoaderState : advanceLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,loanLoaderState: null == loanLoaderState ? _self.loanLoaderState : loanLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,leavePage: null == leavePage ? _self.leavePage : leavePage // ignore: cast_nullable_to_non_nullable
as int,advancePage: null == advancePage ? _self.advancePage : advancePage // ignore: cast_nullable_to_non_nullable
as int,loanPage: null == loanPage ? _self.loanPage : loanPage // ignore: cast_nullable_to_non_nullable
as int,leaveTotalPages: freezed == leaveTotalPages ? _self.leaveTotalPages : leaveTotalPages // ignore: cast_nullable_to_non_nullable
as int?,advanceTotalPages: freezed == advanceTotalPages ? _self.advanceTotalPages : advanceTotalPages // ignore: cast_nullable_to_non_nullable
as int?,loanTotalPages: freezed == loanTotalPages ? _self.loanTotalPages : loanTotalPages // ignore: cast_nullable_to_non_nullable
as int?,leaveLoadingMore: null == leaveLoadingMore ? _self.leaveLoadingMore : leaveLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,advanceLoadingMore: null == advanceLoadingMore ? _self.advanceLoadingMore : advanceLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,loanLoadingMore: null == loanLoadingMore ? _self.loanLoadingMore : loanLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,actionLoader: null == actionLoader ? _self.actionLoader : actionLoader // ignore: cast_nullable_to_non_nullable
as bool,interestRateError: freezed == interestRateError ? _self.interestRateError : interestRateError // ignore: cast_nullable_to_non_nullable
as String?,repaymentPeriodError: freezed == repaymentPeriodError ? _self.repaymentPeriodError : repaymentPeriodError // ignore: cast_nullable_to_non_nullable
as String?,rejectionReasonError: freezed == rejectionReasonError ? _self.rejectionReasonError : rejectionReasonError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HrRequestsState].
extension HrRequestsStatePatterns on HrRequestsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HrRequestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HrRequestsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HrRequestsState value)  $default,){
final _that = this;
switch (_that) {
case _HrRequestsState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HrRequestsState value)?  $default,){
final _that = this;
switch (_that) {
case _HrRequestsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String selectedTab,  List<LeaveRequestItem> leaveRequests,  List<SalaryAdvanceRequestItem> advanceRequests,  List<LoanRequestItem> loanRequests,  LoaderState leaveLoaderState,  LoaderState advanceLoaderState,  LoaderState loanLoaderState,  int leavePage,  int advancePage,  int loanPage,  int? leaveTotalPages,  int? advanceTotalPages,  int? loanTotalPages,  bool leaveLoadingMore,  bool advanceLoadingMore,  bool loanLoadingMore,  bool actionLoader,  String? interestRateError,  String? repaymentPeriodError,  String? rejectionReasonError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HrRequestsState() when $default != null:
return $default(_that.selectedTab,_that.leaveRequests,_that.advanceRequests,_that.loanRequests,_that.leaveLoaderState,_that.advanceLoaderState,_that.loanLoaderState,_that.leavePage,_that.advancePage,_that.loanPage,_that.leaveTotalPages,_that.advanceTotalPages,_that.loanTotalPages,_that.leaveLoadingMore,_that.advanceLoadingMore,_that.loanLoadingMore,_that.actionLoader,_that.interestRateError,_that.repaymentPeriodError,_that.rejectionReasonError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String selectedTab,  List<LeaveRequestItem> leaveRequests,  List<SalaryAdvanceRequestItem> advanceRequests,  List<LoanRequestItem> loanRequests,  LoaderState leaveLoaderState,  LoaderState advanceLoaderState,  LoaderState loanLoaderState,  int leavePage,  int advancePage,  int loanPage,  int? leaveTotalPages,  int? advanceTotalPages,  int? loanTotalPages,  bool leaveLoadingMore,  bool advanceLoadingMore,  bool loanLoadingMore,  bool actionLoader,  String? interestRateError,  String? repaymentPeriodError,  String? rejectionReasonError)  $default,) {final _that = this;
switch (_that) {
case _HrRequestsState():
return $default(_that.selectedTab,_that.leaveRequests,_that.advanceRequests,_that.loanRequests,_that.leaveLoaderState,_that.advanceLoaderState,_that.loanLoaderState,_that.leavePage,_that.advancePage,_that.loanPage,_that.leaveTotalPages,_that.advanceTotalPages,_that.loanTotalPages,_that.leaveLoadingMore,_that.advanceLoadingMore,_that.loanLoadingMore,_that.actionLoader,_that.interestRateError,_that.repaymentPeriodError,_that.rejectionReasonError);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String selectedTab,  List<LeaveRequestItem> leaveRequests,  List<SalaryAdvanceRequestItem> advanceRequests,  List<LoanRequestItem> loanRequests,  LoaderState leaveLoaderState,  LoaderState advanceLoaderState,  LoaderState loanLoaderState,  int leavePage,  int advancePage,  int loanPage,  int? leaveTotalPages,  int? advanceTotalPages,  int? loanTotalPages,  bool leaveLoadingMore,  bool advanceLoadingMore,  bool loanLoadingMore,  bool actionLoader,  String? interestRateError,  String? repaymentPeriodError,  String? rejectionReasonError)?  $default,) {final _that = this;
switch (_that) {
case _HrRequestsState() when $default != null:
return $default(_that.selectedTab,_that.leaveRequests,_that.advanceRequests,_that.loanRequests,_that.leaveLoaderState,_that.advanceLoaderState,_that.loanLoaderState,_that.leavePage,_that.advancePage,_that.loanPage,_that.leaveTotalPages,_that.advanceTotalPages,_that.loanTotalPages,_that.leaveLoadingMore,_that.advanceLoadingMore,_that.loanLoadingMore,_that.actionLoader,_that.interestRateError,_that.repaymentPeriodError,_that.rejectionReasonError);case _:
  return null;

}
}

}

/// @nodoc


class _HrRequestsState implements HrRequestsState {
  const _HrRequestsState({this.selectedTab = 'LEAVE', final  List<LeaveRequestItem> leaveRequests = const [], final  List<SalaryAdvanceRequestItem> advanceRequests = const [], final  List<LoanRequestItem> loanRequests = const [], this.leaveLoaderState = LoaderState.loaded, this.advanceLoaderState = LoaderState.loaded, this.loanLoaderState = LoaderState.loaded, this.leavePage = 1, this.advancePage = 1, this.loanPage = 1, this.leaveTotalPages, this.advanceTotalPages, this.loanTotalPages, this.leaveLoadingMore = false, this.advanceLoadingMore = false, this.loanLoadingMore = false, this.actionLoader = false, this.interestRateError, this.repaymentPeriodError, this.rejectionReasonError}): _leaveRequests = leaveRequests,_advanceRequests = advanceRequests,_loanRequests = loanRequests;
  

@override@JsonKey() final  String selectedTab;
 final  List<LeaveRequestItem> _leaveRequests;
@override@JsonKey() List<LeaveRequestItem> get leaveRequests {
  if (_leaveRequests is EqualUnmodifiableListView) return _leaveRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leaveRequests);
}

 final  List<SalaryAdvanceRequestItem> _advanceRequests;
@override@JsonKey() List<SalaryAdvanceRequestItem> get advanceRequests {
  if (_advanceRequests is EqualUnmodifiableListView) return _advanceRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_advanceRequests);
}

 final  List<LoanRequestItem> _loanRequests;
@override@JsonKey() List<LoanRequestItem> get loanRequests {
  if (_loanRequests is EqualUnmodifiableListView) return _loanRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_loanRequests);
}

@override@JsonKey() final  LoaderState leaveLoaderState;
@override@JsonKey() final  LoaderState advanceLoaderState;
@override@JsonKey() final  LoaderState loanLoaderState;
@override@JsonKey() final  int leavePage;
@override@JsonKey() final  int advancePage;
@override@JsonKey() final  int loanPage;
@override final  int? leaveTotalPages;
@override final  int? advanceTotalPages;
@override final  int? loanTotalPages;
@override@JsonKey() final  bool leaveLoadingMore;
@override@JsonKey() final  bool advanceLoadingMore;
@override@JsonKey() final  bool loanLoadingMore;
@override@JsonKey() final  bool actionLoader;
@override final  String? interestRateError;
@override final  String? repaymentPeriodError;
@override final  String? rejectionReasonError;

/// Create a copy of HrRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HrRequestsStateCopyWith<_HrRequestsState> get copyWith => __$HrRequestsStateCopyWithImpl<_HrRequestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HrRequestsState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other._leaveRequests, _leaveRequests)&&const DeepCollectionEquality().equals(other._advanceRequests, _advanceRequests)&&const DeepCollectionEquality().equals(other._loanRequests, _loanRequests)&&(identical(other.leaveLoaderState, leaveLoaderState) || other.leaveLoaderState == leaveLoaderState)&&(identical(other.advanceLoaderState, advanceLoaderState) || other.advanceLoaderState == advanceLoaderState)&&(identical(other.loanLoaderState, loanLoaderState) || other.loanLoaderState == loanLoaderState)&&(identical(other.leavePage, leavePage) || other.leavePage == leavePage)&&(identical(other.advancePage, advancePage) || other.advancePage == advancePage)&&(identical(other.loanPage, loanPage) || other.loanPage == loanPage)&&(identical(other.leaveTotalPages, leaveTotalPages) || other.leaveTotalPages == leaveTotalPages)&&(identical(other.advanceTotalPages, advanceTotalPages) || other.advanceTotalPages == advanceTotalPages)&&(identical(other.loanTotalPages, loanTotalPages) || other.loanTotalPages == loanTotalPages)&&(identical(other.leaveLoadingMore, leaveLoadingMore) || other.leaveLoadingMore == leaveLoadingMore)&&(identical(other.advanceLoadingMore, advanceLoadingMore) || other.advanceLoadingMore == advanceLoadingMore)&&(identical(other.loanLoadingMore, loanLoadingMore) || other.loanLoadingMore == loanLoadingMore)&&(identical(other.actionLoader, actionLoader) || other.actionLoader == actionLoader)&&(identical(other.interestRateError, interestRateError) || other.interestRateError == interestRateError)&&(identical(other.repaymentPeriodError, repaymentPeriodError) || other.repaymentPeriodError == repaymentPeriodError)&&(identical(other.rejectionReasonError, rejectionReasonError) || other.rejectionReasonError == rejectionReasonError));
}


@override
int get hashCode => Object.hashAll([runtimeType,selectedTab,const DeepCollectionEquality().hash(_leaveRequests),const DeepCollectionEquality().hash(_advanceRequests),const DeepCollectionEquality().hash(_loanRequests),leaveLoaderState,advanceLoaderState,loanLoaderState,leavePage,advancePage,loanPage,leaveTotalPages,advanceTotalPages,loanTotalPages,leaveLoadingMore,advanceLoadingMore,loanLoadingMore,actionLoader,interestRateError,repaymentPeriodError,rejectionReasonError]);

@override
String toString() {
  return 'HrRequestsState(selectedTab: $selectedTab, leaveRequests: $leaveRequests, advanceRequests: $advanceRequests, loanRequests: $loanRequests, leaveLoaderState: $leaveLoaderState, advanceLoaderState: $advanceLoaderState, loanLoaderState: $loanLoaderState, leavePage: $leavePage, advancePage: $advancePage, loanPage: $loanPage, leaveTotalPages: $leaveTotalPages, advanceTotalPages: $advanceTotalPages, loanTotalPages: $loanTotalPages, leaveLoadingMore: $leaveLoadingMore, advanceLoadingMore: $advanceLoadingMore, loanLoadingMore: $loanLoadingMore, actionLoader: $actionLoader, interestRateError: $interestRateError, repaymentPeriodError: $repaymentPeriodError, rejectionReasonError: $rejectionReasonError)';
}


}

/// @nodoc
abstract mixin class _$HrRequestsStateCopyWith<$Res> implements $HrRequestsStateCopyWith<$Res> {
  factory _$HrRequestsStateCopyWith(_HrRequestsState value, $Res Function(_HrRequestsState) _then) = __$HrRequestsStateCopyWithImpl;
@override @useResult
$Res call({
 String selectedTab, List<LeaveRequestItem> leaveRequests, List<SalaryAdvanceRequestItem> advanceRequests, List<LoanRequestItem> loanRequests, LoaderState leaveLoaderState, LoaderState advanceLoaderState, LoaderState loanLoaderState, int leavePage, int advancePage, int loanPage, int? leaveTotalPages, int? advanceTotalPages, int? loanTotalPages, bool leaveLoadingMore, bool advanceLoadingMore, bool loanLoadingMore, bool actionLoader, String? interestRateError, String? repaymentPeriodError, String? rejectionReasonError
});




}
/// @nodoc
class __$HrRequestsStateCopyWithImpl<$Res>
    implements _$HrRequestsStateCopyWith<$Res> {
  __$HrRequestsStateCopyWithImpl(this._self, this._then);

  final _HrRequestsState _self;
  final $Res Function(_HrRequestsState) _then;

/// Create a copy of HrRequestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? leaveRequests = null,Object? advanceRequests = null,Object? loanRequests = null,Object? leaveLoaderState = null,Object? advanceLoaderState = null,Object? loanLoaderState = null,Object? leavePage = null,Object? advancePage = null,Object? loanPage = null,Object? leaveTotalPages = freezed,Object? advanceTotalPages = freezed,Object? loanTotalPages = freezed,Object? leaveLoadingMore = null,Object? advanceLoadingMore = null,Object? loanLoadingMore = null,Object? actionLoader = null,Object? interestRateError = freezed,Object? repaymentPeriodError = freezed,Object? rejectionReasonError = freezed,}) {
  return _then(_HrRequestsState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as String,leaveRequests: null == leaveRequests ? _self._leaveRequests : leaveRequests // ignore: cast_nullable_to_non_nullable
as List<LeaveRequestItem>,advanceRequests: null == advanceRequests ? _self._advanceRequests : advanceRequests // ignore: cast_nullable_to_non_nullable
as List<SalaryAdvanceRequestItem>,loanRequests: null == loanRequests ? _self._loanRequests : loanRequests // ignore: cast_nullable_to_non_nullable
as List<LoanRequestItem>,leaveLoaderState: null == leaveLoaderState ? _self.leaveLoaderState : leaveLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,advanceLoaderState: null == advanceLoaderState ? _self.advanceLoaderState : advanceLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,loanLoaderState: null == loanLoaderState ? _self.loanLoaderState : loanLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,leavePage: null == leavePage ? _self.leavePage : leavePage // ignore: cast_nullable_to_non_nullable
as int,advancePage: null == advancePage ? _self.advancePage : advancePage // ignore: cast_nullable_to_non_nullable
as int,loanPage: null == loanPage ? _self.loanPage : loanPage // ignore: cast_nullable_to_non_nullable
as int,leaveTotalPages: freezed == leaveTotalPages ? _self.leaveTotalPages : leaveTotalPages // ignore: cast_nullable_to_non_nullable
as int?,advanceTotalPages: freezed == advanceTotalPages ? _self.advanceTotalPages : advanceTotalPages // ignore: cast_nullable_to_non_nullable
as int?,loanTotalPages: freezed == loanTotalPages ? _self.loanTotalPages : loanTotalPages // ignore: cast_nullable_to_non_nullable
as int?,leaveLoadingMore: null == leaveLoadingMore ? _self.leaveLoadingMore : leaveLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,advanceLoadingMore: null == advanceLoadingMore ? _self.advanceLoadingMore : advanceLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,loanLoadingMore: null == loanLoadingMore ? _self.loanLoadingMore : loanLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,actionLoader: null == actionLoader ? _self.actionLoader : actionLoader // ignore: cast_nullable_to_non_nullable
as bool,interestRateError: freezed == interestRateError ? _self.interestRateError : interestRateError // ignore: cast_nullable_to_non_nullable
as String?,repaymentPeriodError: freezed == repaymentPeriodError ? _self.repaymentPeriodError : repaymentPeriodError // ignore: cast_nullable_to_non_nullable
as String?,rejectionReasonError: freezed == rejectionReasonError ? _self.rejectionReasonError : rejectionReasonError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
