import 'package:flutter/material.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/services/repo_di.dart';
import 'package:hrms_mobile/src/hr/requests/repo/hr_requests_repo.dart';
import 'package:hrms_mobile/src/hr/requests/state/hr_requests_state.dart';
import 'package:hrms_mobile/utils/helpers/validators.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hr_requests_notifier.g.dart';

@riverpod
class HrRequestsNotifier extends _$HrRequestsNotifier {
  HrRequestsRepo get hrRequestsRepo =>
      ref.read(hrRequestsRepositoryProvider);

  final TextEditingController rejectionReasonController =
      TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController repaymentPeriodController =
      TextEditingController();

  @override
  HrRequestsState build() {
    ref.onDispose(() {
      rejectionReasonController.dispose();
      interestRateController.dispose();
      repaymentPeriodController.dispose();
    });
    return const HrRequestsState(
      selectedTab: 'LEAVE',
      leaveRequests: [],
      advanceRequests: [],
      loanRequests: [],
      leaveLoaderState: LoaderState.loaded,
      advanceLoaderState: LoaderState.loaded,
      loanLoaderState: LoaderState.loaded,
    );
  }

  void clearActionControllers() {
    rejectionReasonController.clear();
    interestRateController.clear();
    repaymentPeriodController.clear();
    state = state.copyWith(
      interestRateError: null,
      repaymentPeriodError: null,
      rejectionReasonError: null,
    );
  }

  void clearInterestRateError() {
    state = state.copyWith(interestRateError: null);
  }

  void clearRepaymentPeriodError() {
    state = state.copyWith(repaymentPeriodError: null);
  }

  void clearRejectionReasonError() {
    state = state.copyWith(rejectionReasonError: null);
  }

  void setSelectedTab(String tab) {
    state = state.copyWith(selectedTab: tab);
  }

  Future<void> fetchLeaveRequests() async {
    state = state.copyWith(leaveLoaderState: LoaderState.loading);
    final result = await hrRequestsRepo.getPendingLeave(page: 1);
    if (!ref.mounted) return;
    result.fold(
      (error) => state = state.copyWith(leaveLoaderState: LoaderState.error),
      (response) => state = state.copyWith(
        leaveRequests: response.data,
        leavePage: 1,
        leaveTotalPages: response.totalPages,
        leaveLoaderState: response.data.isEmpty
            ? LoaderState.noData
            : LoaderState.loaded,
      ),
    );
  }

  Future<void> fetchAdvanceRequests() async {
    state = state.copyWith(advanceLoaderState: LoaderState.loading);
    final result = await hrRequestsRepo.getPendingSalaryAdvance(page: 1);
    if (!ref.mounted) return;
    result.fold(
      (error) => state = state.copyWith(advanceLoaderState: LoaderState.error),
      (response) => state = state.copyWith(
        advanceRequests: response.data,
        advancePage: 1,
        advanceTotalPages: response.totalPages,
        advanceLoaderState: response.data.isEmpty
            ? LoaderState.noData
            : LoaderState.loaded,
      ),
    );
  }

  Future<void> fetchLoanRequests() async {
    state = state.copyWith(loanLoaderState: LoaderState.loading);
    final result = await hrRequestsRepo.getPendingLoans(page: 1);
    if (!ref.mounted) return;
    result.fold(
      (error) => state = state.copyWith(loanLoaderState: LoaderState.error),
      (response) => state = state.copyWith(
        loanRequests: response.data,
        loanPage: 1,
        loanTotalPages: response.totalPages,
        loanLoaderState: response.data.isEmpty
            ? LoaderState.noData
            : LoaderState.loaded,
      ),
    );
  }

  Future<void> loadMoreLeaveRequests() async {
    final totalPages = state.leaveTotalPages;
    if (state.leaveLoadingMore ||
        (totalPages != null && state.leavePage >= totalPages)) {
      return;
    }
    state = state.copyWith(leaveLoadingMore: true);
    final nextPage = state.leavePage + 1;
    final result = await hrRequestsRepo.getPendingLeave(page: nextPage);
    if (!ref.mounted) return;
    result.fold(
      (_) => state = state.copyWith(leaveLoadingMore: false),
      (response) => state = state.copyWith(
        leaveRequests: [...state.leaveRequests, ...response.data],
        leavePage: nextPage,
        leaveTotalPages: response.totalPages,
        leaveLoadingMore: false,
      ),
    );
  }

  Future<void> loadMoreAdvanceRequests() async {
    final totalPages = state.advanceTotalPages;
    if (state.advanceLoadingMore ||
        (totalPages != null && state.advancePage >= totalPages)) {
      return;
    }
    state = state.copyWith(advanceLoadingMore: true);
    final nextPage = state.advancePage + 1;
    final result = await hrRequestsRepo.getPendingSalaryAdvance(
      page: nextPage,
    );
    if (!ref.mounted) return;
    result.fold(
      (_) => state = state.copyWith(advanceLoadingMore: false),
      (response) => state = state.copyWith(
        advanceRequests: [...state.advanceRequests, ...response.data],
        advancePage: nextPage,
        advanceTotalPages: response.totalPages,
        advanceLoadingMore: false,
      ),
    );
  }

  Future<void> loadMoreLoanRequests() async {
    final totalPages = state.loanTotalPages;
    if (state.loanLoadingMore ||
        (totalPages != null && state.loanPage >= totalPages)) {
      return;
    }
    state = state.copyWith(loanLoadingMore: true);
    final nextPage = state.loanPage + 1;
    final result = await hrRequestsRepo.getPendingLoans(page: nextPage);
    if (!ref.mounted) return;
    result.fold(
      (_) => state = state.copyWith(loanLoadingMore: false),
      (response) => state = state.copyWith(
        loanRequests: [...state.loanRequests, ...response.data],
        loanPage: nextPage,
        loanTotalPages: response.totalPages,
        loanLoadingMore: false,
      ),
    );
  }

  Future<void> submitApproveLeave(
    BuildContext context,
    String requestId,
  ) async {
    state = state.copyWith(actionLoader: true);
    final result = await hrRequestsRepo.submitAction(requestId, {
      'action': 'APPROVE',
    });
    if (!ref.mounted) return;
    result.fold((error) => state = state.copyWith(actionLoader: false), (
      success,
    ) {
      state = state.copyWith(actionLoader: false);
      fetchLeaveRequests();
      if (context.mounted) Navigator.of(context).pop(context);
    });
  }

  Future<void> submitApproveAdvance(
    BuildContext context,
    String requestId,
  ) async {
    final interestRateError = Validators.validateInterestRate(
      interestRateController.text,
    );
    final repaymentPeriodError = Validators.validateRepaymentPeriod(
      repaymentPeriodController.text,
    );
    if (interestRateError != null || repaymentPeriodError != null) {
      state = state.copyWith(
        interestRateError: interestRateError,
        repaymentPeriodError: repaymentPeriodError,
      );
      return;
    }
    state = state.copyWith(
      actionLoader: true,
      interestRateError: null,
      repaymentPeriodError: null,
    );
    final interestRate = int.tryParse(interestRateController.text.trim()) ?? 0;
    final repaymentPeriod =
        int.tryParse(repaymentPeriodController.text.trim()) ?? 6;
    final result = await hrRequestsRepo.submitAction(requestId, {
      'action': 'APPROVE',
      'interestRate': interestRate,
      'repaymentPeriod': repaymentPeriod,
    });
    if (!ref.mounted) return;
    result.fold((error) => state = state.copyWith(actionLoader: false), (_) {
      state = state.copyWith(actionLoader: false);
      fetchAdvanceRequests();
      if (context.mounted) Navigator.of(context).pop(context);
    });
  }

  Future<void> submitApproveLoan(BuildContext context, String requestId) async {
    final interestRateError = Validators.validateInterestRate(
      interestRateController.text,
    );
    final repaymentPeriodError = Validators.validateRepaymentPeriod(
      repaymentPeriodController.text,
    );
    if (interestRateError != null || repaymentPeriodError != null) {
      state = state.copyWith(
        interestRateError: interestRateError,
        repaymentPeriodError: repaymentPeriodError,
      );
      return;
    }
    state = state.copyWith(
      actionLoader: true,
      interestRateError: null,
      repaymentPeriodError: null,
    );
    final interestRate = int.tryParse(interestRateController.text.trim()) ?? 0;
    final repaymentPeriod =
        int.tryParse(repaymentPeriodController.text.trim()) ?? 6;
    final result = await hrRequestsRepo.submitAction(requestId, {
      'action': 'APPROVE',
      'interestRate': interestRate,
      'repaymentPeriod': repaymentPeriod,
    });
    if (!ref.mounted) return;
    result.fold((error) => state = state.copyWith(actionLoader: false), (
      success,
    ) {
      state = state.copyWith(actionLoader: false);
      fetchLoanRequests();
      if (context.mounted) Navigator.of(context).pop(context);
    });
  }

  Future<void> submitReject(BuildContext context, String requestId) async {
    final rejectionReasonError = Validators.validateRejectionReason(
      rejectionReasonController.text,
    );
    if (rejectionReasonError != null) {
      state = state.copyWith(rejectionReasonError: rejectionReasonError);
      return;
    }
    state = state.copyWith(actionLoader: true, rejectionReasonError: null);
    final reason = rejectionReasonController.text.trim();
    final result = await hrRequestsRepo.submitAction(requestId, {
      'action': 'REJECT',
      'rejectionReason': reason,
    });
    if (!ref.mounted) return;
    result.fold((error) => state = state.copyWith(actionLoader: false), (
      success,
    ) {
      state = state.copyWith(actionLoader: false);
      final tab = state.selectedTab;
      if (tab == 'LEAVE') {
        fetchLeaveRequests();
      } else if (tab == 'ADVANCE') {
        fetchAdvanceRequests();
      } else {
        fetchLoanRequests();
      }
      if (context.mounted) Navigator.of(context).pop(context);
    });
  }
}
