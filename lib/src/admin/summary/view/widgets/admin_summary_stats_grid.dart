import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../attendance/provider/attendance_provider.dart';

class AdminSummaryStatsGrid extends ConsumerWidget {
  const AdminSummaryStatsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(attendanceFilterProvider);
    final isDubai = filterState.branch == "Dubai HQ";
    final isOman = filterState.branch.contains("Oman");

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.6,
      children: [
        _AdminStatCard(
          label: "PRESENT",
          value: isDubai ? "12" : (isOman ? "4" : "6"),
          stripeColor: ColorPalette.primaryColor,
          valueColor: ColorPalette.primaryColor,
        ),
        _AdminStatCard(
          label: "ABSENT",
          value: isDubai ? "1" : (isOman ? "3" : "2"),
          stripeColor: ColorPalette.fFF0000,
          valueColor: ColorPalette.fFF0000,
        ),
        _AdminStatCard(
          label: "LATE ARRIVALS",
          value: isDubai ? "1" : (isOman ? "0" : "4"),
          stripeColor: ColorPalette.fFF7C34,
          valueColor: ColorPalette.fFF7C34,
        ),
        _AdminStatCard(
          label: "PENDING",
          value: isDubai ? "1" : (isOman ? "2" : "3"),
          stripeColor: const Color(0xFFC0C7CD),
          valueColor: ColorPalette.f101828,
        ),
      ],
    );
  }
}

class _AdminStatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color stripeColor;
  final Color valueColor;

  const _AdminStatCard({
    required this.label,
    required this.value,
    required this.stripeColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: stripeColor,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
          smoothness: 1,
        ),
        shadows: [
          BoxShadow(
            color: ColorPalette.black.withValues(alpha: 0.08),
            offset: const Offset(0, 1),
            blurRadius: 16,
          ),
        ],
      ),
      child: SmoothContainer(
        margin: EdgeInsets.only(bottom: 6.h),
        smoothness: 1,
        borderRadius: BorderRadius.circular(23.r),
        color: ColorPalette.white,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: PlusJakartaSansFontPalette.base700(
                11,
                color: const Color(0xFF94A3B8),
                letterSpacing: 1.2,
              ),
            ),
            4.verticalSpace,
            Text(
              value,
              style: PlusJakartaSansFontPalette.base700(36, color: valueColor),
            ),
          ],
        ),
      ),
    );
  }
}
