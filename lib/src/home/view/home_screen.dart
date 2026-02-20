import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/styles/color_palette.dart';
import '../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import '../../../utils/common_widgets/common_switch_state.dart';
import '../notifier/staff_pulse_notifier.dart';
import 'widgets/pulse_header_card.dart';
import 'widgets/pulse_quick_actions.dart';
import 'widgets/pulse_recent_activities.dart';
import 'widgets/pulse_recent_payslip_card.dart';
import 'widgets/shimmer/pulse_header_card_shimmer.dart';

import 'widgets/shimmer/pulse_quick_actions_shimmer.dart';
import 'widgets/shimmer/pulse_recent_payslip_card_shimmer.dart';
import 'widgets/shimmer/pulse_recent_activities_shimmer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final staffPulseState = ref.watch(staffPulseProvider);
    final notifier = ref.read(staffPulseProvider.notifier);

    return Scaffold(
      backgroundColor: ColorPalette.fF6F6F6.withValues(alpha: 0.5),
      body: SafeArea(
        bottom: false,
        child: CommonSwitchState(
          loaderState: staffPulseState.loaderState,
          reload: () => notifier.fetchAttendanceData(isRefresh: true),
          loader: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PulseHeaderCardShimmer(),
                  24.verticalSpace,
                  const PulseQuickActionsShimmer(),
                  24.verticalSpace,
                  const PulseRecentPayslipCardShimmer(),
                  32.verticalSpace,
                  const PulseRecentActivitiesShimmer(),
                ],
              ),
            ),
          ),
          child: AdaptiveRefreshIndicator(
            onRefresh: () async {
              await notifier.fetchAttendanceData(isRefresh: true);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PulseHeaderCard(
                      attendanceRecord: staffPulseState.currentUserRecord,
                    ),
                    24.verticalSpace,
                    const PulseQuickActions(),
                    24.verticalSpace,
                    PulseRecentPayslipCard(
                      payslip:
                          (staffPulseState.payslipData != null &&
                              staffPulseState.payslipData!.isNotEmpty)
                          ? staffPulseState.payslipData!.first
                          : null,
                    ),
                    32.verticalSpace,
                    PulseRecentActivities(
                      activities: staffPulseState.recentActivities ?? [],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
