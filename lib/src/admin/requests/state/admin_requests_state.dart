import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/src/admin/requests/model/leave_request_item.dart';
import 'package:hrms_mobile/src/admin/requests/model/loan_request_item.dart';
import 'package:hrms_mobile/src/admin/requests/model/salary_advance_request_item.dart';

part 'admin_requests_state.freezed.dart';

@freezed
sealed class AdminRequestsState with _$AdminRequestsState {
  const factory AdminRequestsState({
    @Default('LEAVE') String selectedTab,
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
    @Default(false) bool actionLoader,
    String? interestRateError,
    String? repaymentPeriodError,
    String? rejectionReasonError,
  }) = _AdminRequestsState;
}
