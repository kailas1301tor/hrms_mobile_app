import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import 'widgets/admin_live_action_items.dart';
import 'widgets/admin_summary_stats_grid.dart';

class AdminSummaryScreen extends StatelessWidget {
  const AdminSummaryScreen({super.key});

  Future<void> _onRefresh() async {
    // Simulate refresh
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveRefreshIndicator(
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AdminSummaryStatsGrid(),
              // 24.verticalSpace,
              // const AdminRegionalPresenceCard(),
              24.verticalSpace,
              const AdminLiveActionItems(),
              // Add some bottom padding for better scroll experience
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
