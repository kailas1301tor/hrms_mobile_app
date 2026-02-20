import 'package:hrms_mobile/res/enums/enums.dart';
import '../../home/model/staff_payslip_response.dart';

class StaffSalaryState {
  final LoaderState loaderState;
  final List<StaffPayslipResponse>? payslips;
  final String? error;
  final String? downloadingPayslipId;

  StaffSalaryState({
    this.loaderState = LoaderState.loading,
    this.payslips,
    this.error,
    this.downloadingPayslipId,
  });

  StaffSalaryState copyWith({
    LoaderState? loaderState,
    List<StaffPayslipResponse>? payslips,
    String? error,
    String? downloadingPayslipId,
    bool clearDownloadingId = false,
  }) {
    return StaffSalaryState(
      loaderState: loaderState ?? this.loaderState,
      payslips: payslips ?? this.payslips,
      error: error ?? this.error,
      downloadingPayslipId: clearDownloadingId
          ? null
          : (downloadingPayslipId ?? this.downloadingPayslipId),
    );
  }
}
