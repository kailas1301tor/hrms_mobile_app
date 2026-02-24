import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/services/repo_di.dart';
import 'package:hrms_mobile/src/track/repo/track_repo.dart';
import 'package:hrms_mobile/src/track/state/track_state.dart';
import 'package:hrms_mobile/utils/helpers/common_functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'track_notifier.g.dart';

@riverpod
class TrackNotifier extends _$TrackNotifier {
  TrackRepo get trackRepo => ref.read(trackRepositoryProvider);

  @override
  TrackState build() => const TrackState();

  Future<void> fetchLeaveTypes() async {
    state = state.copyWith(leaveTypesLoaderState: LoaderState.loading);
    trackRepo
        .getLeaveTypes()
        .fold(
          (left) {
            state = state.copyWith(leaveTypesLoaderState: LoaderState.error);
            debugPrint(left.toString());
          },
          (right) {
            state = state.copyWith(
              leaveTypes: right.data,
              leaveTypesLoaderState: LoaderState.loaded,
            );
          },
        )
        .catchError((error) {
          state = state.copyWith(createRequestLoader: false);
          debugPrint(error.toString());
        });
  }

  Future<bool> submitLeaveRequest(
    String leaveTypeId,
    String leaveTypeName,
    String fromDate,
    String toDate,
    String reason, {
    bool isHalfDay = false,
  }) async {
    // When half-day is selected, enforce toDate == fromDate
    final effectiveToDate = isHalfDay ? fromDate : toDate;
    final String numberOfDays;
    if (isHalfDay) {
      numberOfDays = '0.5';
    } else {
      final from = DateTime.tryParse(fromDate);
      final to = DateTime.tryParse(effectiveToDate);
      numberOfDays = (from != null && to != null && !to.isBefore(from))
          ? (to.difference(from).inDays + 1).toString()
          : '1';
    }
    state = state.copyWith(createRequestLoader: true);
    final body = {
      'requestType': 'LEAVE',
      'details': {
        'leaveType': leaveTypeName,
        'leaveTypeId': leaveTypeId,
        'isPaid': true,
        'isHalfDay': isHalfDay,
        'numberOfDays': numberOfDays,
        'fromDate': fromDate,
        'toDate': effectiveToDate,
        'reason': reason,
      },
    };
    return trackRepo
        .createRequest(body)
        .fold(
          (left) {
            state = state.copyWith(createRequestLoader: false);
            showCustomToast(
              message: left.message ?? 'Failed to submit leave request',
              isSuccess: false,
            );
            return false;
          },
          (right) {
            state = state.copyWith(createRequestLoader: false);
            showCustomToast(
              message: right.message ?? 'Leave request submitted successfully',
              isSuccess: true,
            );
            fetchLeaveRequests();
            return true;
          },
        )
        .catchError((error) {
          state = state.copyWith(createRequestLoader: false);
          debugPrint(error.toString());
          return false;
        });
  }

  Future<bool> submitAdvanceRequest(int amount, String reason) async {
    state = state.copyWith(createRequestLoader: true);
    final body = {
      'requestType': 'SALARY',
      'details': {
        'subType': 'salary_advance',
        'amount': amount,
        'reason': reason,
      },
    };
    return trackRepo
        .createRequest(body)
        .fold(
          (left) {
            state = state.copyWith(createRequestLoader: false);
            showCustomToast(
              message: left.message ?? 'Failed to submit advance request',
              isSuccess: false,
            );
            return false;
          },
          (right) {
            state = state.copyWith(createRequestLoader: false);
            showCustomToast(
              message:
                  right.message ?? 'Advance request submitted successfully',
              isSuccess: true,
            );
            fetchAdvanceRequests();
            return true;
          },
        )
        .catchError((error) {
          state = state.copyWith(createRequestLoader: false);
          debugPrint(error.toString());
          return false;
        });
  }

  Future<bool> submitLoanRequest(
    int amount,
    int repaymentPeriod,
    String reason,
  ) async {
    state = state.copyWith(createRequestLoader: true);
    final body = {
      'requestType': 'SALARY',
      'details': {
        'subType': 'loan',
        'amount': amount,
        'repaymentPeriod': repaymentPeriod,
        'reason': reason,
      },
    };
    return trackRepo
        .createRequest(body)
        .fold(
          (left) {
            state = state.copyWith(createRequestLoader: false);
            showCustomToast(
              message: left.message ?? 'Failed to submit loan request',
              isSuccess: false,
            );
            return false;
          },
          (right) {
            state = state.copyWith(createRequestLoader: false);
            showCustomToast(
              message: right.message ?? 'Loan request submitted successfully',
              isSuccess: true,
            );
            fetchLoanRequests();
            return true;
          },
        )
        .catchError((error) {
          state = state.copyWith(createRequestLoader: false);
          showCustomToast(message: error.toString(), isSuccess: false);
          return false;
        });
  }

  Future<void> fetchLeaveRequests() async {
    state = state.copyWith(leaveLoaderState: LoaderState.loading);
    await trackRepo
        .getMyLeaveRequests(page: 1)
        .fold(
          (left) {
            state = state.copyWith(leaveLoaderState: LoaderState.loaded);
            debugPrint(left.toString());
          },
          (response) {
            state = state.copyWith(
              leaveRequests: response.data,
              leavePage: 1,
              leaveTotalPages: response.pagination?.pages,
              leaveLoaderState: response.data.isEmpty
                  ? LoaderState.noData
                  : LoaderState.loaded,
            );
          },
        )
        .catchError((error) {
          state = state.copyWith(leaveLoaderState: LoaderState.error);
          debugPrint(error.toString());
        });
  }

  Future<void> fetchAdvanceRequests() async {
    state = state.copyWith(advanceLoaderState: LoaderState.loading);
    await trackRepo
        .getMyAdvanceRequests(page: 1)
        .fold(
          (left) {
            state = state.copyWith(advanceLoaderState: LoaderState.error);
            debugPrint(left.toString());
          },
          (response) {
            state = state.copyWith(
              advanceRequests: response.data,
              advancePage: 1,
              advanceTotalPages: response.pagination?.pages,
              advanceLoaderState: response.data.isEmpty
                  ? LoaderState.noData
                  : LoaderState.loaded,
            );
          },
        )
        .catchError((error) {
          state = state.copyWith(advanceLoaderState: LoaderState.error);
          debugPrint(error.toString());
        });
  }

  Future<void> fetchLoanRequests() async {
    state = state.copyWith(loanLoaderState: LoaderState.loading);
    await trackRepo
        .getMyLoanRequests(page: 1)
        .fold(
          (left) {
            state = state.copyWith(loanLoaderState: LoaderState.error);
            debugPrint(left.toString());
          },
          (response) {
            state = state.copyWith(
              loanRequests: response.data,
              loanPage: 1,
              loanTotalPages: response.pagination?.pages,
              loanLoaderState: response.data.isEmpty
                  ? LoaderState.noData
                  : LoaderState.loaded,
            );
          },
        )
        .catchError((error) {
          state = state.copyWith(loanLoaderState: LoaderState.error);
          debugPrint(error.toString());
        });
  }

  Future<void> loadMoreLeaveRequests() async {
    if (state.leaveLoadingMore ||
        (state.leaveTotalPages != null &&
            state.leavePage >= state.leaveTotalPages!)) {
      return;
    }
    state = state.copyWith(leaveLoadingMore: true);
    final nextPage = state.leavePage + 1;
    await trackRepo
        .getMyLeaveRequests(page: nextPage)
        .fold(
          (left) {
            state = state.copyWith(leaveLoadingMore: false);
            debugPrint(left.toString());
          },
          (response) {
            state = state.copyWith(
              leaveRequests: [...state.leaveRequests, ...response.data],
              leavePage: nextPage,
              leaveTotalPages: response.pagination?.pages,
              leaveLoadingMore: false,
            );
          },
        )
        .catchError((error) {
          state = state.copyWith(leaveLoadingMore: false);
          debugPrint(error.toString());
        });
  }

  Future<void> loadMoreAdvanceRequests() async {
    if (state.advanceLoadingMore ||
        (state.advanceTotalPages != null &&
            state.advancePage >= state.advanceTotalPages!)) {
      return;
    }
    state = state.copyWith(advanceLoadingMore: true);
    final nextPage = state.advancePage + 1;
    await trackRepo
        .getMyAdvanceRequests(page: nextPage)
        .fold(
          (left) {
            state = state.copyWith(advanceLoadingMore: false);
            debugPrint(left.toString());
          },
          (response) {
            state = state.copyWith(
              advanceRequests: [...state.advanceRequests, ...response.data],
              advancePage: nextPage,
              advanceTotalPages: response.pagination?.pages,
              advanceLoadingMore: false,
            );
          },
        )
        .catchError((error) {
          state = state.copyWith(advanceLoadingMore: false);
          debugPrint(error.toString());
        });
  }

  Future<void> loadMoreLoanRequests() async {
    if (state.loanLoadingMore ||
        (state.loanTotalPages != null &&
            state.loanPage >= state.loanTotalPages!)) {
      return;
    }
    state = state.copyWith(loanLoadingMore: true);
    final nextPage = state.loanPage + 1;
    await trackRepo
        .getMyLoanRequests(page: nextPage)
        .fold(
          (left) {
            state = state.copyWith(loanLoadingMore: false);
            debugPrint(left.toString());
          },
          (response) {
            state = state.copyWith(
              loanRequests: [...state.loanRequests, ...response.data],
              loanPage: nextPage,
              loanTotalPages: response.pagination?.pages,
              loanLoadingMore: false,
            );
          },
        )
        .catchError((error) {
          state = state.copyWith(loanLoadingMore: false);
          debugPrint(error.toString());
        });
  }
}
