import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/services/repo_di.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repo/attendance_repo.dart';
import '../model/hr_attendance_response.dart';
import '../state/attendance_state.dart';

part 'attendance_notifier.g.dart';

@Riverpod(name: 'hrAttendanceProvider')
class HrAttendanceNotifier extends _$HrAttendanceNotifier {
  HrAttendanceRepo get _repo => ref.read(hrAttendanceRepositoryProvider);
  int _lastRequestId = 0;

  @override
  HrAttendanceState build() {
    final String initialDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    Future.microtask(() async {
      await getBranches();
      getAttendance();
    });

    return HrAttendanceState(date: initialDate);
  }

  Future<void> getBranches({bool isRefresh = false}) async {
    if (isRefresh || state.branches.isEmpty) {
      if (!isRefresh) {
        state = state.copyWith(branchLoaderState: LoaderState.loading);
      }

      final result = await _repo.getBranches();

      result.fold(
        (error) {
          state = state.copyWith(
            branchLoaderState: isRefresh
                ? state.branchLoaderState
                : LoaderState.error,
          );
        },
        (response) {
          state = state.copyWith(
            branchLoaderState: LoaderState.loaded,
            branches: response.data,
          );
        },
      );
    }
  }

  Future<void> getAttendance({
    bool isLoadMore = false,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      state = state.copyWith(dataCache: {});
    }

    if (isLoadMore) {
      if (state.isLoadMore ||
          state.pagination == null ||
          state.currentPage >= (state.pagination?.totalPages ?? 1)) {
        return;
      }
      state = state.copyWith(isLoadMore: true);
    } else {
      if (!isRefresh && state.dataCache.containsKey(state.status)) {
        final cachedData = state.dataCache[state.status]!;
        state = state.copyWith(
          loaderState: LoaderState.loaded,
          records: cachedData.data ?? [],
          summary: cachedData.summary,
          pagination: cachedData.pagination,
          currentPage: cachedData.pagination?.current ?? 1,
        );
        return;
      }

      state = state.copyWith(
        loaderState: LoaderState.loading,
        currentPage: 1,
        records: [],
        summary: null,
      );
    }

    final requestId = ++_lastRequestId;

    final result = await _repo.getAttendance(
      date: state.date,
      page: isLoadMore ? state.currentPage + 1 : 1,
      limit: 10,
      status: state.status == 'ALL'
          ? null
          : state.status[0].toUpperCase() +
                state.status.substring(1).toLowerCase(),
      branch: state.branch,
    );

    if (requestId != _lastRequestId) return;

    result.fold(
      (error) {
        state = state.copyWith(
          loaderState: isLoadMore || isRefresh
              ? state.loaderState
              : LoaderState.error,
          isLoadMore: false,
          error: error.message ?? "Failed to fetch attendance",
        );
      },
      (response) {
        final List<AttendanceRecord> mergedRecords = isLoadMore
            ? [...state.records, ...(response.data ?? <AttendanceRecord>[])]
            : (response.data ?? <AttendanceRecord>[]);

        final Map<String, HrAttendanceResponse> newCache = Map.from(
          state.dataCache,
        );

        newCache[state.status] = HrAttendanceResponse(
          data: mergedRecords,
          summary: response.summary ?? state.summary,
          pagination: response.pagination,
        );

        state = state.copyWith(
          loaderState: LoaderState.loaded,
          isLoadMore: false,
          currentPage: response.pagination?.current ?? state.currentPage,
          records: mergedRecords,
          summary: response.summary ?? state.summary,
          pagination: response.pagination,
          dataCache: newCache,
        );
      },
    );
  }

  void updateDate(DateTime date) {
    final String dateString = DateFormat('yyyy-MM-dd').format(date);
    if (state.date == dateString) return;
    state = state.copyWith(date: dateString);
    getAttendance();
  }

  void updateStatus(String status) {
    if (state.status == status) return;
    state = state.copyWith(status: status);
    getAttendance();
  }

  void updateBranch(String branch) {
    if (state.branch == branch) return;
    state = state.copyWith(branch: branch);
    getAttendance(isRefresh: true);
  }
}
