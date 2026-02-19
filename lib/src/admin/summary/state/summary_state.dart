import 'package:hrms_mobile/res/enums/enums.dart';
import '../model/pending_approvals_response.dart';
import '../model/summary_stats_response.dart';

class SummaryState {
  final LoaderState loaderState;
  final SummaryStatsResponse? stats;
  final PendingApprovalsResponse? pendingApprovals;
  final String? error;

  const SummaryState({
    this.loaderState = LoaderState.loading,
    this.stats,
    this.pendingApprovals,
    this.error,
  });

  SummaryState copyWith({
    LoaderState? loaderState,
    SummaryStatsResponse? stats,
    PendingApprovalsResponse? pendingApprovals,
    String? error,
    bool clearStats = false,
    bool clearPendingApprovals = false,
  }) {
    return SummaryState(
      loaderState: loaderState ?? this.loaderState,
      stats: clearStats ? null : (stats ?? this.stats),
      pendingApprovals: clearPendingApprovals
          ? null
          : (pendingApprovals ?? this.pendingApprovals),
      error: error ?? this.error,
    );
  }

  // Helper getters for backward compatibility if needed, though we should prefer loaderState
  bool get isLoading => loaderState == LoaderState.loading;
}
