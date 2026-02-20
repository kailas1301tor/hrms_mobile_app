import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import 'widgets/hr_attendance_stats_grid.dart';
import 'widgets/hr_attendance_filter.dart';
import 'widgets/hr_attendance_list.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../utils/common_widgets/common_switch_state.dart';
import 'package:hrms_mobile/src/hr/attendance/notifier/attendance_notifier.dart';

class HrAttendanceScreen extends ConsumerWidget {
  const HrAttendanceScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    await ref.read(hrAttendanceProvider.notifier).getAttendance(isRefresh: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceLoaderState = ref.watch(
      hrAttendanceProvider.select((s) => s.loaderState),
    );

    return AdaptiveRefreshIndicator(
      color: ColorPalette.primaryColor,
      backgroundColor: Colors.white,
      onRefresh: () => _onRefresh(ref),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            ref
                .read(hrAttendanceProvider.notifier)
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
                    const HrAttendanceStatsGrid(),
                    24.verticalSpace,
                    const HrAttendanceFilter(),
                    24.verticalSpace,
                    const HrAttendanceList(),
                  ],
                ),
              ),
              noData: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: constraints.maxHeight,
                  alignment: Alignment.center,
                  child:
                      const HrAttendanceList(),
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
                      const HrAttendanceStatsGrid(),
                      24.verticalSpace,
                      const HrAttendanceFilter(),
                      24.verticalSpace,
                      const HrAttendanceList(),
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
