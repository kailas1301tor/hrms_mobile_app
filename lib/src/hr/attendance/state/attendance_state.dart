import 'package:hrms_mobile/res/enums/enums.dart';
import '../model/hr_attendance_response.dart';

class HrAttendanceState {
  final LoaderState loaderState;
  final List<AttendanceRecord> records;
  final Summary? summary;
  final Pagination? pagination;
  final String? error;
  final String date;
  final String status;
  final String branch;
  final int currentPage;
  final bool isLoadMore;

  final List<String> branches;
  final LoaderState branchLoaderState;

  final Map<String, HrAttendanceResponse> dataCache;

  HrAttendanceState({
    this.loaderState = LoaderState.loading,
    this.records = const [],
    this.summary,
    this.pagination,
    this.error,
    required this.date,
    this.status = 'ALL',
    this.branch = 'All Branches',
    this.currentPage = 1,
    this.isLoadMore = false,
    this.branches = const [],
    this.branchLoaderState = LoaderState.loading,
    this.dataCache = const {},
  });

  HrAttendanceState copyWith({
    LoaderState? loaderState,
    List<AttendanceRecord>? records,
    Summary? summary,
    Pagination? pagination,
    String? error,
    String? date,
    String? status,
    String? branch,
    int? currentPage,
    bool? isLoadMore,
    List<String>? branches,
    LoaderState? branchLoaderState,
    Map<String, HrAttendanceResponse>? dataCache,
  }) {
    return HrAttendanceState(
      loaderState: loaderState ?? this.loaderState,
      records: records ?? this.records,
      summary: summary ?? this.summary,
      pagination: pagination ?? this.pagination,
      error: error ?? this.error,
      date: date ?? this.date,
      status: status ?? this.status,
      branch: branch ?? this.branch,
      currentPage: currentPage ?? this.currentPage,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      branches: branches ?? this.branches,
      branchLoaderState: branchLoaderState ?? this.branchLoaderState,
      dataCache: dataCache ?? this.dataCache,
    );
  }
}
