import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../../../res/enums/enums.dart';
import 'package:hrms_mobile/src/hr/attendance/notifier/attendance_notifier.dart';
import 'package:shimmer/shimmer.dart';

class HrAttendanceStatsGrid extends ConsumerWidget {
  const HrAttendanceStatsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState = ref.watch(
      hrAttendanceProvider.select((s) => (s.summary, s.error, s.loaderState)),
    );
    final summary = attendanceState.$1;

    if (attendanceState.$3 == LoaderState.loading && summary == null) {
      return const _HrAttendanceStatsShimmer();
    }

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.6,
      children: [
        _HrStatCard(
          label: "PRESENT",
          value: "${summary?.present ?? 0}",
          stripeColor: ColorPalette.primaryColor,
          valueColor: ColorPalette.primaryColor,
        ),
        _HrStatCard(
          label: "ABSENT",
          value: "${summary?.absent ?? 0}",
          stripeColor: ColorPalette.fFF0000,
          valueColor: ColorPalette.fFF0000,
        ),
        _HrStatCard(
          label: "LATE ARRIVALS",
          value: "${summary?.late ?? 0}",
          stripeColor: ColorPalette.fFF7C34,
          valueColor: ColorPalette.fFF7C34,
        ),
        _HrStatCard(
          label: "ON LEAVE",
          value: "${summary?.onLeave ?? 0}",
          stripeColor: const Color(0xFFC0C7CD),
          valueColor: ColorPalette.f101828,
        ),
      ],
    );
  }
}

class _HrStatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color stripeColor;
  final Color valueColor;

  const _HrStatCard({
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
            color: Colors.black.withValues(alpha: 0.08),
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

class _HrAttendanceStatsShimmer extends StatelessWidget {
  const _HrAttendanceStatsShimmer();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16.w,
      mainAxisSpacing: 16.h,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.6,
      children: List.generate(4, (index) {
        return Container(
          decoration: ShapeDecoration(
            color: const Color(0xFFE2E8F0),
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(28.r),
              smoothness: 1,
            ),
          ),
          child: SmoothContainer(
            margin: EdgeInsets.only(bottom: 6.h),
            smoothness: 1,
            borderRadius: BorderRadius.circular(23.r),
            color: ColorPalette.white,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Shimmer.fromColors(
              baseColor: const Color(0xFFE2E8F0),
              highlightColor: const Color(0xFFF8FAFC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  12.verticalSpace,
                  Container(
                    width: 50.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
