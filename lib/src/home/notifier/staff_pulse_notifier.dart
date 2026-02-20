import 'package:hrms_mobile/data/local/sembast_services.dart';
import 'package:hrms_mobile/res/enums/enums.dart';
import 'package:hrms_mobile/services/repo_di.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/staff_attendance_response.dart';
import '../model/staff_payslip_response.dart';
import '../model/staff_request_response.dart';
import '../repo/staff_pulse_repo.dart';
import '../state/staff_pulse_state.dart';

part 'staff_pulse_notifier.g.dart';

@Riverpod(name: 'staffPulseProvider')
class StaffPulseNotifier extends _$StaffPulseNotifier {
  StaffPulseRepo get _repo => ref.read(staffPulseRepositoryProvider);
  SembastServices get _sembast => ref.read(sembastServicesProvider);

  @override
  StaffPulseState build() {
    final String initialDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Initial fetch
    Future.microtask(() => fetchAttendanceData());

    return StaffPulseState(date: initialDate);
  }

  Future<void> fetchAttendanceData({bool isRefresh = false}) async {
    if (state.loaderState == LoaderState.loaded && !isRefresh) return;

    state = state.copyWith(loaderState: LoaderState.loading);

    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Calculate previous month for payslip
    final now = DateTime.now();
    final previousMonthDate = DateTime(now.year, now.month - 1);
    final month = previousMonthDate.month;
    final year = previousMonthDate.year;

    final result = await _repo.getAttendance(date: date);
    final payslipResult = await _repo.getMyPayslips(month: month, year: year);
    final requestResult = await _repo.getMyRequests(
      page: 1,
      limit: 10,
      status: "PENDING",
    ); // Fetch pending by default as per request

    result.fold(
      (error) {
        state = state.copyWith(
          loaderState: LoaderState.error,
          error: error.message ?? "Failed to fetch data",
        );
      },
      (response) async {
        // Get current user ID to filter the record
        final loginResponse = await _sembast.getLoginResponse();
        final currentUserId = loginResponse?.user?.employeeId;

        StaffAttendanceRecord? userRecord;
        if (currentUserId != null && response.data != null) {
          try {
            userRecord = response.data!.firstWhere(
              (element) => element.employeeId == currentUserId,
            );
          } catch (e) {
            // User record not found in the list
            userRecord = null;
          }
        }

        List<StaffPayslipResponse>? payslips;
        payslipResult.fold((l) => payslips = null, (r) => payslips = r);

        List<StaffRequestResponse>? requests;
        requestResult.fold((l) => requests = null, (r) => requests = r);

        state = state.copyWith(
          loaderState: LoaderState.loaded,
          attendanceData: response,
          currentUserRecord: userRecord,
          payslipData: payslips,
          recentActivities: requests,
        );
      },
    );
  }

  void updateDate(DateTime date) {
    final String dateString = DateFormat('yyyy-MM-dd').format(date);
    if (state.date == dateString) return;
    state = state.copyWith(date: dateString);
    fetchAttendanceData();
  }
}
