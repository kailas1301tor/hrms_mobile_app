import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import '../../../../../utils/common_widgets/common_switch_state.dart';
import '../notifier/summary_notifier.dart';
import 'widgets/admin_live_action_items.dart';
import 'widgets/admin_summary_stats_grid.dart';

class AdminSummaryScreen extends ConsumerWidget {
  const AdminSummaryScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    await ref.read(summaryProvider.notifier).getSummaryStats();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryLoaderState = ref.watch(
      summaryProvider.select((state) => state.loaderState),
    );

    return AdaptiveRefreshIndicator(
      onRefresh: () => _onRefresh(ref),
      child: CommonSwitchState(
        loaderState: summaryLoaderState,
        reload: () => _onRefresh(ref),
        // Providing a custom loader that uses our existing shimmers for a cohesive look
        loader: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              const AdminSummaryStatsGrid(),
              24.verticalSpace,
              const AdminLiveActionItems(),
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
                const AdminSummaryStatsGrid(),
                24.verticalSpace,
                const AdminLiveActionItems(),
                32.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
