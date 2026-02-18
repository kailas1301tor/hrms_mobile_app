import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendanceFilterState {
  final String branch;
  final String status;

  AttendanceFilterState({required this.branch, required this.status});

  AttendanceFilterState copyWith({String? branch, String? status}) {
    return AttendanceFilterState(
      branch: branch ?? this.branch,
      status: status ?? this.status,
    );
  }
}

class AttendanceFilterNotifier extends Notifier<AttendanceFilterState> {
  @override
  AttendanceFilterState build() {
    return AttendanceFilterState(branch: "All Branches (UAE)", status: "ALL");
  }

  void setBranch(String branch) {
    state = state.copyWith(branch: branch);
  }

  void setStatus(String status) {
    state = state.copyWith(status: status);
  }
}

final attendanceFilterProvider =
    NotifierProvider<AttendanceFilterNotifier, AttendanceFilterState>(() {
      return AttendanceFilterNotifier();
    });
