import 'package:hrms_mobile/res/enums/enums.dart';
import '../model/staff_attendance_response.dart';
import '../model/staff_payslip_response.dart';
import '../model/staff_request_response.dart';

class StaffPulseState {
  final LoaderState loaderState;
  final StaffAttendanceResponse? attendanceData;
  final StaffAttendanceRecord? currentUserRecord;
  final List<StaffPayslipResponse>? payslipData;
  final List<StaffRequestResponse>? recentActivities;
  final String? error;
  final String? date;

  StaffPulseState({
    this.loaderState = LoaderState.loading,
    this.attendanceData,
    this.currentUserRecord,
    this.payslipData,
    this.recentActivities,
    this.error,
    this.date,
  });

  StaffPulseState copyWith({
    LoaderState? loaderState,
    StaffAttendanceResponse? attendanceData,
    StaffAttendanceRecord? currentUserRecord,
    List<StaffPayslipResponse>? payslipData,
    List<StaffRequestResponse>? recentActivities,
    String? error,
    String? date,
  }) {
    return StaffPulseState(
      loaderState: loaderState ?? this.loaderState,
      attendanceData: attendanceData ?? this.attendanceData,
      currentUserRecord: currentUserRecord ?? this.currentUserRecord,
      payslipData: payslipData ?? this.payslipData,
      recentActivities: recentActivities ?? this.recentActivities,
      error: error ?? this.error,
      date: date ?? this.date,
    );
  }
}
