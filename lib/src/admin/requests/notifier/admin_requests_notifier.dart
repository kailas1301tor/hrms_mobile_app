import 'package:flutter/material.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/services/repo_di.dart';
import 'package:hrms_mobile/src/admin/requests/repo/admin_requests_repo.dart';
import 'package:hrms_mobile/src/admin/requests/state/admin_requests_state.dart';
import 'package:hrms_mobile/utils/helpers/common_functions.dart';
import 'package:hrms_mobile/utils/helpers/validators.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_requests_notifier.g.dart';

@riverpod
class AdminRequestsNotifier extends _$AdminRequestsNotifier {
  AdminRequestsRepo get adminRequestsRepo =>
      ref.read(adminRequestsRepositoryProvider);

  final TextEditingController rejectionReasonController =
      TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController repaymentPeriodController =
      TextEditingController();

  @override
  AdminRequestsState build() {
    ref.onDispose(() {
      rejectionReasonController.dispose();
      interestRateController.dispose();
      repaymentPeriodController.dispose();
    });
    return const AdminRequestsState(
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
    final result = await adminRequestsRepo.getPendingLeave(page: 1);
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
    final result = await adminRequestsRepo.getPendingSalaryAdvance(page: 1);
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
    final result = await adminRequestsRepo.getPendingLoans(page: 1);
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
    final result = await adminRequestsRepo.getPendingLeave(page: nextPage);
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
    final result = await adminRequestsRepo.getPendingSalaryAdvance(
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
    final result = await adminRequestsRepo.getPendingLoans(page: nextPage);
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
    final result = await adminRequestsRepo.submitAction(requestId, {
      'action': 'APPROVE',
    });
    if (!ref.mounted) return;
    result.fold((error) => state = state.copyWith(actionLoader: false), (
      success,
    ) {
      state = state.copyWith(actionLoader: false);
      showCustomToast(message: 'Leave approved successfully', isSuccess: true);
      fetchLeaveRequests();
      if (context.mounted) Navigator.of(context).pop(context);
    });
  }

  Future<void> submitApproveAdvance(
    BuildContext context,
    String requestId,
    int amount,
  ) async {
    state = state.copyWith(actionLoader: true);
    final result = await adminRequestsRepo.submitAction(requestId, {
      'action': 'APPROVE',
      'amount': amount,
    });
    if (!ref.mounted) return;
    result.fold((error) => state = state.copyWith(actionLoader: false), (_) {
      state = state.copyWith(actionLoader: false);
      showCustomToast(
        message: 'Advance approved successfully',
        isSuccess: true,
      );
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
    final result = await adminRequestsRepo.submitAction(requestId, {
      'action': 'APPROVE',
      'interestRate': interestRate,
      'repaymentPeriod': repaymentPeriod,
    });
    if (!ref.mounted) return;
    result.fold((error) => state = state.copyWith(actionLoader: false), (
      success,
    ) {
      state = state.copyWith(actionLoader: false);
      showCustomToast(message: 'Loan approved successfully', isSuccess: true);
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
    final result = await adminRequestsRepo.submitAction(requestId, {
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
        showCustomToast(
          message: 'Leave rejected successfully',
          isSuccess: true,
        );
        fetchLeaveRequests();
      } else if (tab == 'ADVANCE') {
        showCustomToast(
          message: 'Advance rejected successfully',
          isSuccess: true,
        );
        fetchAdvanceRequests();
      } else {
        showCustomToast(message: 'Loan rejected successfully', isSuccess: true);
        fetchLoanRequests();
      }
      if (context.mounted) Navigator.of(context).pop(context);
    });
  }
}
