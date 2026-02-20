import 'package:hrms_mobile/services/repo_di.dart';
import 'package:hrms_mobile/src/admin/summary/repo/summary_repo.dart';
import 'package:hrms_mobile/src/admin/summary/state/summary_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hrms_mobile/res/enums/enums.dart';

part 'summary_notifier.g.dart';

@riverpod
class HrSummaryNotifier extends _$HrSummaryNotifier {
  SummaryRepo get summaryRepo => ref.read(summaryRepositoryProvider);

  @override
  SummaryState build() {
    Future.microtask(() => getAllData());
    return const SummaryState(loaderState: LoaderState.loading);
  }

  Future<void> getAllData() async {
    state = state.copyWith(loaderState: LoaderState.loading, error: null);

    final statsResult = await summaryRepo.getMobileStats();
    final pendingResult = await summaryRepo.getPendingApprovals();

    bool hasError = false;
    String? errorMessage;

    statsResult.fold(
      (error) {
        hasError = true;
        errorMessage = error.message ?? "An error occurred";
      },
      (stats) {
        state = state.copyWith(stats: stats);
      },
    );

    if (hasError) {
      state = state.copyWith(
        loaderState: LoaderState.error,
        error: errorMessage,
      );
      return;
    }

    pendingResult.fold(
      (error) {
        state = state.copyWith(
          loaderState: LoaderState.error,
          error: error.message ?? "An error occurred",
        );
      },
      (pending) {
        state = state.copyWith(
          loaderState: LoaderState.loaded,
          pendingApprovals: pending,
        );
      },
    );
  }

  Future<void> getSummaryStats() async {
    state = state.copyWith(
      loaderState: LoaderState.loading,
      clearStats: true,
      clearPendingApprovals: true,
    );
    await getAllData();
  }
}
