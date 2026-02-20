import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import '../../../../../utils/common_widgets/common_switch_state.dart';
import '../notifier/summary_notifier.dart';
import 'widgets/hr_live_action_items.dart';
import 'widgets/hr_summary_stats_grid.dart';

class HrSummaryScreen extends ConsumerWidget {
  const HrSummaryScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    await ref.read(hrSummaryProvider.notifier).getSummaryStats();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryLoaderState = ref.watch(
      hrSummaryProvider.select((state) => state.loaderState),
    );

    return AdaptiveRefreshIndicator(
      onRefresh: () => _onRefresh(ref),
      child: CommonSwitchState(
        loaderState: summaryLoaderState,
        reload: () => _onRefresh(ref),
        loader: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              const HrSummaryStatsGrid(),
              24.verticalSpace,
              const HrLiveActionItems(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HrSummaryStatsGrid(),
                24.verticalSpace,
                const HrLiveActionItems(),
                32.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
