import 'package:flutter_riverpod/flutter_riverpod.dart';

class HrAttendanceFilterState {
  final String branch;
  final String status;

  HrAttendanceFilterState({required this.branch, required this.status});

  HrAttendanceFilterState copyWith({String? branch, String? status}) {
    return HrAttendanceFilterState(
      branch: branch ?? this.branch,
      status: status ?? this.status,
    );
  }
}

class HrAttendanceFilterNotifier extends Notifier<HrAttendanceFilterState> {
  @override
  HrAttendanceFilterState build() {
    return HrAttendanceFilterState(branch: "All Branches", status: "ALL");
  }

  void setBranch(String branch) {
    state = state.copyWith(branch: branch);
  }

  void setStatus(String status) {
    state = state.copyWith(status: status);
  }
}

final hrAttendanceFilterProvider =
    NotifierProvider<HrAttendanceFilterNotifier, HrAttendanceFilterState>(() {
      return HrAttendanceFilterNotifier();
    });
