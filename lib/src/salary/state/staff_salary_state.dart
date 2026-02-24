import 'package:hrms_mobile/res/enums/enums.dart';
import '../../home/model/staff_payslip_response.dart';

class StaffSalaryState {
  final LoaderState loaderState;
  final List<StaffPayslipResponse>? payslips;
  final String? error;
  final String? downloadingPayslipId;
  final int? selectedMonth;
  final int? selectedYear;

  StaffSalaryState({
    this.loaderState = LoaderState.loading,
    this.payslips,
    this.error,
    this.downloadingPayslipId,
    this.selectedMonth,
    this.selectedYear,
  });

  StaffSalaryState copyWith({
    LoaderState? loaderState,
    List<StaffPayslipResponse>? payslips,
    String? error,
    String? downloadingPayslipId,
    bool clearDownloadingId = false,
    int? selectedMonth,
    int? selectedYear,
    bool clearMonth = false,
    bool clearYear = false,
  }) {
    return StaffSalaryState(
      loaderState: loaderState ?? this.loaderState,
      payslips: payslips ?? this.payslips,
      error: error ?? this.error,
      downloadingPayslipId: clearDownloadingId
          ? null
          : (downloadingPayslipId ?? this.downloadingPayslipId),
      selectedMonth: clearMonth ? null : (selectedMonth ?? this.selectedMonth),
      selectedYear: clearYear ? null : (selectedYear ?? this.selectedYear),
    );
  }
}
