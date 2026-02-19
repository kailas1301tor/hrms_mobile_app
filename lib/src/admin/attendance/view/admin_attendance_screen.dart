import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import 'widgets/admin_attendance_stats_grid.dart';
import 'widgets/admin_attendance_filter.dart';
import 'widgets/admin_attendance_list.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../utils/common_widgets/common_switch_state.dart';
import 'package:hrms_mobile/src/admin/attendance/notifier/attendance_notifier.dart';

class AdminAttendanceScreen extends ConsumerWidget {
  const AdminAttendanceScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    await ref.read(attendanceProvider.notifier).getAttendance(isRefresh: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceLoaderState = ref.watch(
      attendanceProvider.select((s) => s.loaderState),
    );

    return AdaptiveRefreshIndicator(
      color: ColorPalette.primaryColor,
      backgroundColor: Colors.white,
      onRefresh: () => _onRefresh(ref),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            ref
                .read(attendanceProvider.notifier)
                .getAttendance(isLoadMore: true);
          }
          return false;
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CommonSwitchState(
              loaderState: attendanceLoaderState,
              reload: () => _onRefresh(ref),
              scrollPhysics: const AlwaysScrollableScrollPhysics(),
              loader: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    const AdminAttendanceStatsGrid(),
                    24.verticalSpace,
                    const AdminAttendanceFilter(),
                    24.verticalSpace,
                    const AdminAttendanceList(),
                  ],
                ),
              ),
              noData: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: constraints.maxHeight,
                  alignment: Alignment.center,
                  child:
                      const AdminAttendanceList(), // AdminAttendanceList handles empty state UI
                ),
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AdminAttendanceStatsGrid(),
                      24.verticalSpace,
                      const AdminAttendanceFilter(),
                      24.verticalSpace,
                      const AdminAttendanceList(),
                      32.verticalSpace,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
