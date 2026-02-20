import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/src/admin/requests/model/leave_request_item.dart';
import 'package:hrms_mobile/src/admin/requests/model/loan_request_item.dart';
import 'package:hrms_mobile/src/admin/requests/model/salary_advance_request_item.dart';
import 'package:hrms_mobile/src/track/model/leave_type_item.dart';

part 'track_state.freezed.dart';

@freezed
sealed class TrackState with _$TrackState {
  const factory TrackState({
    @Default([]) List<LeaveRequestItem> leaveRequests,
    @Default([]) List<SalaryAdvanceRequestItem> advanceRequests,
    @Default([]) List<LoanRequestItem> loanRequests,
    @Default(LoaderState.loaded) LoaderState leaveLoaderState,
    @Default(LoaderState.loaded) LoaderState advanceLoaderState,
    @Default(LoaderState.loaded) LoaderState loanLoaderState,
    @Default(1) int leavePage,
    @Default(1) int advancePage,
    @Default(1) int loanPage,
    int? leaveTotalPages,
    int? advanceTotalPages,
    int? loanTotalPages,
    @Default(false) bool leaveLoadingMore,
    @Default(false) bool advanceLoadingMore,
    @Default(false) bool loanLoadingMore,
    List<LeaveTypeItem>? leaveTypes,
    @Default(LoaderState.loaded) LoaderState leaveTypesLoaderState,
    @Default(false) bool createRequestLoader,
  }) = _TrackState;
}
