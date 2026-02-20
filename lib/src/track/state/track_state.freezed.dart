// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackState {

 List<LeaveRequestItem> get leaveRequests; List<SalaryAdvanceRequestItem> get advanceRequests; List<LoanRequestItem> get loanRequests; LoaderState get leaveLoaderState; LoaderState get advanceLoaderState; LoaderState get loanLoaderState; int get leavePage; int get advancePage; int get loanPage; int? get leaveTotalPages; int? get advanceTotalPages; int? get loanTotalPages; bool get leaveLoadingMore; bool get advanceLoadingMore; bool get loanLoadingMore; List<LeaveTypeItem>? get leaveTypes; LoaderState get leaveTypesLoaderState; bool get createRequestLoader;
/// Create a copy of TrackState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackStateCopyWith<TrackState> get copyWith => _$TrackStateCopyWithImpl<TrackState>(this as TrackState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackState&&const DeepCollectionEquality().equals(other.leaveRequests, leaveRequests)&&const DeepCollectionEquality().equals(other.advanceRequests, advanceRequests)&&const DeepCollectionEquality().equals(other.loanRequests, loanRequests)&&(identical(other.leaveLoaderState, leaveLoaderState) || other.leaveLoaderState == leaveLoaderState)&&(identical(other.advanceLoaderState, advanceLoaderState) || other.advanceLoaderState == advanceLoaderState)&&(identical(other.loanLoaderState, loanLoaderState) || other.loanLoaderState == loanLoaderState)&&(identical(other.leavePage, leavePage) || other.leavePage == leavePage)&&(identical(other.advancePage, advancePage) || other.advancePage == advancePage)&&(identical(other.loanPage, loanPage) || other.loanPage == loanPage)&&(identical(other.leaveTotalPages, leaveTotalPages) || other.leaveTotalPages == leaveTotalPages)&&(identical(other.advanceTotalPages, advanceTotalPages) || other.advanceTotalPages == advanceTotalPages)&&(identical(other.loanTotalPages, loanTotalPages) || other.loanTotalPages == loanTotalPages)&&(identical(other.leaveLoadingMore, leaveLoadingMore) || other.leaveLoadingMore == leaveLoadingMore)&&(identical(other.advanceLoadingMore, advanceLoadingMore) || other.advanceLoadingMore == advanceLoadingMore)&&(identical(other.loanLoadingMore, loanLoadingMore) || other.loanLoadingMore == loanLoadingMore)&&const DeepCollectionEquality().equals(other.leaveTypes, leaveTypes)&&(identical(other.leaveTypesLoaderState, leaveTypesLoaderState) || other.leaveTypesLoaderState == leaveTypesLoaderState)&&(identical(other.createRequestLoader, createRequestLoader) || other.createRequestLoader == createRequestLoader));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(leaveRequests),const DeepCollectionEquality().hash(advanceRequests),const DeepCollectionEquality().hash(loanRequests),leaveLoaderState,advanceLoaderState,loanLoaderState,leavePage,advancePage,loanPage,leaveTotalPages,advanceTotalPages,loanTotalPages,leaveLoadingMore,advanceLoadingMore,loanLoadingMore,const DeepCollectionEquality().hash(leaveTypes),leaveTypesLoaderState,createRequestLoader);

@override
String toString() {
  return 'TrackState(leaveRequests: $leaveRequests, advanceRequests: $advanceRequests, loanRequests: $loanRequests, leaveLoaderState: $leaveLoaderState, advanceLoaderState: $advanceLoaderState, loanLoaderState: $loanLoaderState, leavePage: $leavePage, advancePage: $advancePage, loanPage: $loanPage, leaveTotalPages: $leaveTotalPages, advanceTotalPages: $advanceTotalPages, loanTotalPages: $loanTotalPages, leaveLoadingMore: $leaveLoadingMore, advanceLoadingMore: $advanceLoadingMore, loanLoadingMore: $loanLoadingMore, leaveTypes: $leaveTypes, leaveTypesLoaderState: $leaveTypesLoaderState, createRequestLoader: $createRequestLoader)';
}


}

/// @nodoc
abstract mixin class $TrackStateCopyWith<$Res>  {
  factory $TrackStateCopyWith(TrackState value, $Res Function(TrackState) _then) = _$TrackStateCopyWithImpl;
@useResult
$Res call({
 List<LeaveRequestItem> leaveRequests, List<SalaryAdvanceRequestItem> advanceRequests, List<LoanRequestItem> loanRequests, LoaderState leaveLoaderState, LoaderState advanceLoaderState, LoaderState loanLoaderState, int leavePage, int advancePage, int loanPage, int? leaveTotalPages, int? advanceTotalPages, int? loanTotalPages, bool leaveLoadingMore, bool advanceLoadingMore, bool loanLoadingMore, List<LeaveTypeItem>? leaveTypes, LoaderState leaveTypesLoaderState, bool createRequestLoader
});




}
/// @nodoc
class _$TrackStateCopyWithImpl<$Res>
    implements $TrackStateCopyWith<$Res> {
  _$TrackStateCopyWithImpl(this._self, this._then);

  final TrackState _self;
  final $Res Function(TrackState) _then;

/// Create a copy of TrackState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveRequests = null,Object? advanceRequests = null,Object? loanRequests = null,Object? leaveLoaderState = null,Object? advanceLoaderState = null,Object? loanLoaderState = null,Object? leavePage = null,Object? advancePage = null,Object? loanPage = null,Object? leaveTotalPages = freezed,Object? advanceTotalPages = freezed,Object? loanTotalPages = freezed,Object? leaveLoadingMore = null,Object? advanceLoadingMore = null,Object? loanLoadingMore = null,Object? leaveTypes = freezed,Object? leaveTypesLoaderState = null,Object? createRequestLoader = null,}) {
  return _then(_self.copyWith(
leaveRequests: null == leaveRequests ? _self.leaveRequests : leaveRequests // ignore: cast_nullable_to_non_nullable
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
as bool,leaveTypes: freezed == leaveTypes ? _self.leaveTypes : leaveTypes // ignore: cast_nullable_to_non_nullable
as List<LeaveTypeItem>?,leaveTypesLoaderState: null == leaveTypesLoaderState ? _self.leaveTypesLoaderState : leaveTypesLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,createRequestLoader: null == createRequestLoader ? _self.createRequestLoader : createRequestLoader // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackState].
extension TrackStatePatterns on TrackState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackState value)  $default,){
final _that = this;
switch (_that) {
case _TrackState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LeaveRequestItem> leaveRequests,  List<SalaryAdvanceRequestItem> advanceRequests,  List<LoanRequestItem> loanRequests,  LoaderState leaveLoaderState,  LoaderState advanceLoaderState,  LoaderState loanLoaderState,  int leavePage,  int advancePage,  int loanPage,  int? leaveTotalPages,  int? advanceTotalPages,  int? loanTotalPages,  bool leaveLoadingMore,  bool advanceLoadingMore,  bool loanLoadingMore,  List<LeaveTypeItem>? leaveTypes,  LoaderState leaveTypesLoaderState,  bool createRequestLoader)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackState() when $default != null:
return $default(_that.leaveRequests,_that.advanceRequests,_that.loanRequests,_that.leaveLoaderState,_that.advanceLoaderState,_that.loanLoaderState,_that.leavePage,_that.advancePage,_that.loanPage,_that.leaveTotalPages,_that.advanceTotalPages,_that.loanTotalPages,_that.leaveLoadingMore,_that.advanceLoadingMore,_that.loanLoadingMore,_that.leaveTypes,_that.leaveTypesLoaderState,_that.createRequestLoader);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LeaveRequestItem> leaveRequests,  List<SalaryAdvanceRequestItem> advanceRequests,  List<LoanRequestItem> loanRequests,  LoaderState leaveLoaderState,  LoaderState advanceLoaderState,  LoaderState loanLoaderState,  int leavePage,  int advancePage,  int loanPage,  int? leaveTotalPages,  int? advanceTotalPages,  int? loanTotalPages,  bool leaveLoadingMore,  bool advanceLoadingMore,  bool loanLoadingMore,  List<LeaveTypeItem>? leaveTypes,  LoaderState leaveTypesLoaderState,  bool createRequestLoader)  $default,) {final _that = this;
switch (_that) {
case _TrackState():
return $default(_that.leaveRequests,_that.advanceRequests,_that.loanRequests,_that.leaveLoaderState,_that.advanceLoaderState,_that.loanLoaderState,_that.leavePage,_that.advancePage,_that.loanPage,_that.leaveTotalPages,_that.advanceTotalPages,_that.loanTotalPages,_that.leaveLoadingMore,_that.advanceLoadingMore,_that.loanLoadingMore,_that.leaveTypes,_that.leaveTypesLoaderState,_that.createRequestLoader);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LeaveRequestItem> leaveRequests,  List<SalaryAdvanceRequestItem> advanceRequests,  List<LoanRequestItem> loanRequests,  LoaderState leaveLoaderState,  LoaderState advanceLoaderState,  LoaderState loanLoaderState,  int leavePage,  int advancePage,  int loanPage,  int? leaveTotalPages,  int? advanceTotalPages,  int? loanTotalPages,  bool leaveLoadingMore,  bool advanceLoadingMore,  bool loanLoadingMore,  List<LeaveTypeItem>? leaveTypes,  LoaderState leaveTypesLoaderState,  bool createRequestLoader)?  $default,) {final _that = this;
switch (_that) {
case _TrackState() when $default != null:
return $default(_that.leaveRequests,_that.advanceRequests,_that.loanRequests,_that.leaveLoaderState,_that.advanceLoaderState,_that.loanLoaderState,_that.leavePage,_that.advancePage,_that.loanPage,_that.leaveTotalPages,_that.advanceTotalPages,_that.loanTotalPages,_that.leaveLoadingMore,_that.advanceLoadingMore,_that.loanLoadingMore,_that.leaveTypes,_that.leaveTypesLoaderState,_that.createRequestLoader);case _:
  return null;

}
}

}

/// @nodoc


class _TrackState implements TrackState {
  const _TrackState({final  List<LeaveRequestItem> leaveRequests = const [], final  List<SalaryAdvanceRequestItem> advanceRequests = const [], final  List<LoanRequestItem> loanRequests = const [], this.leaveLoaderState = LoaderState.loaded, this.advanceLoaderState = LoaderState.loaded, this.loanLoaderState = LoaderState.loaded, this.leavePage = 1, this.advancePage = 1, this.loanPage = 1, this.leaveTotalPages, this.advanceTotalPages, this.loanTotalPages, this.leaveLoadingMore = false, this.advanceLoadingMore = false, this.loanLoadingMore = false, final  List<LeaveTypeItem>? leaveTypes, this.leaveTypesLoaderState = LoaderState.loaded, this.createRequestLoader = false}): _leaveRequests = leaveRequests,_advanceRequests = advanceRequests,_loanRequests = loanRequests,_leaveTypes = leaveTypes;
  

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
 final  List<LeaveTypeItem>? _leaveTypes;
@override List<LeaveTypeItem>? get leaveTypes {
  final value = _leaveTypes;
  if (value == null) return null;
  if (_leaveTypes is EqualUnmodifiableListView) return _leaveTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  LoaderState leaveTypesLoaderState;
@override@JsonKey() final  bool createRequestLoader;

/// Create a copy of TrackState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackStateCopyWith<_TrackState> get copyWith => __$TrackStateCopyWithImpl<_TrackState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackState&&const DeepCollectionEquality().equals(other._leaveRequests, _leaveRequests)&&const DeepCollectionEquality().equals(other._advanceRequests, _advanceRequests)&&const DeepCollectionEquality().equals(other._loanRequests, _loanRequests)&&(identical(other.leaveLoaderState, leaveLoaderState) || other.leaveLoaderState == leaveLoaderState)&&(identical(other.advanceLoaderState, advanceLoaderState) || other.advanceLoaderState == advanceLoaderState)&&(identical(other.loanLoaderState, loanLoaderState) || other.loanLoaderState == loanLoaderState)&&(identical(other.leavePage, leavePage) || other.leavePage == leavePage)&&(identical(other.advancePage, advancePage) || other.advancePage == advancePage)&&(identical(other.loanPage, loanPage) || other.loanPage == loanPage)&&(identical(other.leaveTotalPages, leaveTotalPages) || other.leaveTotalPages == leaveTotalPages)&&(identical(other.advanceTotalPages, advanceTotalPages) || other.advanceTotalPages == advanceTotalPages)&&(identical(other.loanTotalPages, loanTotalPages) || other.loanTotalPages == loanTotalPages)&&(identical(other.leaveLoadingMore, leaveLoadingMore) || other.leaveLoadingMore == leaveLoadingMore)&&(identical(other.advanceLoadingMore, advanceLoadingMore) || other.advanceLoadingMore == advanceLoadingMore)&&(identical(other.loanLoadingMore, loanLoadingMore) || other.loanLoadingMore == loanLoadingMore)&&const DeepCollectionEquality().equals(other._leaveTypes, _leaveTypes)&&(identical(other.leaveTypesLoaderState, leaveTypesLoaderState) || other.leaveTypesLoaderState == leaveTypesLoaderState)&&(identical(other.createRequestLoader, createRequestLoader) || other.createRequestLoader == createRequestLoader));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_leaveRequests),const DeepCollectionEquality().hash(_advanceRequests),const DeepCollectionEquality().hash(_loanRequests),leaveLoaderState,advanceLoaderState,loanLoaderState,leavePage,advancePage,loanPage,leaveTotalPages,advanceTotalPages,loanTotalPages,leaveLoadingMore,advanceLoadingMore,loanLoadingMore,const DeepCollectionEquality().hash(_leaveTypes),leaveTypesLoaderState,createRequestLoader);

@override
String toString() {
  return 'TrackState(leaveRequests: $leaveRequests, advanceRequests: $advanceRequests, loanRequests: $loanRequests, leaveLoaderState: $leaveLoaderState, advanceLoaderState: $advanceLoaderState, loanLoaderState: $loanLoaderState, leavePage: $leavePage, advancePage: $advancePage, loanPage: $loanPage, leaveTotalPages: $leaveTotalPages, advanceTotalPages: $advanceTotalPages, loanTotalPages: $loanTotalPages, leaveLoadingMore: $leaveLoadingMore, advanceLoadingMore: $advanceLoadingMore, loanLoadingMore: $loanLoadingMore, leaveTypes: $leaveTypes, leaveTypesLoaderState: $leaveTypesLoaderState, createRequestLoader: $createRequestLoader)';
}


}

/// @nodoc
abstract mixin class _$TrackStateCopyWith<$Res> implements $TrackStateCopyWith<$Res> {
  factory _$TrackStateCopyWith(_TrackState value, $Res Function(_TrackState) _then) = __$TrackStateCopyWithImpl;
@override @useResult
$Res call({
 List<LeaveRequestItem> leaveRequests, List<SalaryAdvanceRequestItem> advanceRequests, List<LoanRequestItem> loanRequests, LoaderState leaveLoaderState, LoaderState advanceLoaderState, LoaderState loanLoaderState, int leavePage, int advancePage, int loanPage, int? leaveTotalPages, int? advanceTotalPages, int? loanTotalPages, bool leaveLoadingMore, bool advanceLoadingMore, bool loanLoadingMore, List<LeaveTypeItem>? leaveTypes, LoaderState leaveTypesLoaderState, bool createRequestLoader
});




}
/// @nodoc
class __$TrackStateCopyWithImpl<$Res>
    implements _$TrackStateCopyWith<$Res> {
  __$TrackStateCopyWithImpl(this._self, this._then);

  final _TrackState _self;
  final $Res Function(_TrackState) _then;

/// Create a copy of TrackState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveRequests = null,Object? advanceRequests = null,Object? loanRequests = null,Object? leaveLoaderState = null,Object? advanceLoaderState = null,Object? loanLoaderState = null,Object? leavePage = null,Object? advancePage = null,Object? loanPage = null,Object? leaveTotalPages = freezed,Object? advanceTotalPages = freezed,Object? loanTotalPages = freezed,Object? leaveLoadingMore = null,Object? advanceLoadingMore = null,Object? loanLoadingMore = null,Object? leaveTypes = freezed,Object? leaveTypesLoaderState = null,Object? createRequestLoader = null,}) {
  return _then(_TrackState(
leaveRequests: null == leaveRequests ? _self._leaveRequests : leaveRequests // ignore: cast_nullable_to_non_nullable
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
as bool,leaveTypes: freezed == leaveTypes ? _self._leaveTypes : leaveTypes // ignore: cast_nullable_to_non_nullable
as List<LeaveTypeItem>?,leaveTypesLoaderState: null == leaveTypesLoaderState ? _self.leaveTypesLoaderState : leaveTypesLoaderState // ignore: cast_nullable_to_non_nullable
as LoaderState,createRequestLoader: null == createRequestLoader ? _self.createRequestLoader : createRequestLoader // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
