import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repo/staff_salary_repo.dart';
import '../state/staff_salary_state.dart';

import 'package:hrms_mobile/services/repo_di.dart';

part 'staff_salary_notifier.g.dart';

@riverpod
class StaffSalaryNotifier extends _$StaffSalaryNotifier {
  StaffSalaryRepo get _repo => ref.read(staffSalaryRepoProvider);

  @override
  StaffSalaryState build() {
    return StaffSalaryState();
  }

  Future<void> fetchSalaryHistory({bool isRefresh = false}) async {
    if (state.loaderState == LoaderState.loaded && !isRefresh) return;

    state = state.copyWith(loaderState: LoaderState.loading);

    final result = await _repo.getSalaryHistory(
      year: state.selectedYear,
      month: state.selectedMonth,
    );

    result.fold(
      (error) {
        state = state.copyWith(
          loaderState: LoaderState.error,
          error: "Failed to fetch salary history",
        );
      },
      (payslips) {
        state = state.copyWith(
          loaderState: payslips.isEmpty
              ? LoaderState.noData
              : LoaderState.loaded,
          payslips: payslips,
        );
      },
    );
  }

  void updateMonthFilter(int? month) {
    state = state.copyWith(selectedMonth: month, clearMonth: month == null);
    fetchSalaryHistory(isRefresh: true);
  }

  void updateYearFilter(int? year) {
    state = state.copyWith(selectedYear: year, clearYear: year == null);
    fetchSalaryHistory(isRefresh: true);
  }

  Future<String?> downloadPayslip(String id, String fileName) async {
    state = state.copyWith(downloadingPayslipId: id);

    try {
      final result = await _repo.downloadPayslip(id: id, fileName: fileName);
      return result.fold((left) => null, (right) => right);
    } finally {
      state = state.copyWith(clearDownloadingId: true);
    }
  }

  Future<String?> saveFileToDevice(String filePath, String fileName) async {
    final result = await _repo.saveFileToDevice(
      filePath: filePath,
      fileName: fileName,
    );
    return result.fold((left) => null, (right) => right);
  }
}
