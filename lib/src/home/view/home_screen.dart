import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/styles/color_palette.dart';
import '../../../utils/common_widgets/adaptive_refresh_indicator.dart';
import 'widgets/pulse_header_card.dart';
import 'widgets/pulse_quick_actions.dart';
import 'widgets/pulse_recent_payslip_card.dart';
import 'widgets/pulse_recent_activities.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.fF6F6F6.withValues(alpha: 0.5),
      body: SafeArea(
        bottom: false,
        child: AdaptiveRefreshIndicator(
          onRefresh: () async {
            log("Home screen is refreshed");
            await Future.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PulseHeaderCard(),
                  24.verticalSpace,
                  const PulseQuickActions(),
                  24.verticalSpace,
                  const PulseRecentPayslipCard(),
                  32.verticalSpace,
                  const PulseRecentActivities(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
