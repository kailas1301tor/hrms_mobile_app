import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import '../../summary/view/widgets/admin_summary_stats_grid.dart'; // Reusing stats grid
import 'widgets/admin_attendance_filter.dart';
import 'widgets/admin_attendance_list.dart';

class AdminAttendanceScreen extends StatelessWidget {
  const AdminAttendanceScreen({super.key});

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
              24.verticalSpace,
              const AdminAttendanceFilter(),
              24.verticalSpace,
              const AdminAttendanceList(),
              // Add some bottom padding for better scroll experience
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
