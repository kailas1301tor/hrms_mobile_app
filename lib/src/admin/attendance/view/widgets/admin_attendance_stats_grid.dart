import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../../../res/enums/enums.dart';
import 'package:hrms_mobile/src/admin/attendance/notifier/attendance_notifier.dart';
import 'package:shimmer/shimmer.dart';

class AdminAttendanceStatsGrid extends ConsumerWidget {
  const AdminAttendanceStatsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState = ref.watch(
      attendanceProvider.select((s) => (s.summary, s.error, s.loaderState)),
    );
    final summary = attendanceState.$1;

    if (attendanceState.$3 == LoaderState.loading && summary == null) {
      return const _AdminAttendanceStatsShimmer();
    }

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
          value: "${summary?.present ?? 0}",
          gradient: const LinearGradient(
            colors: [Color(0xFF10B981), Color(0xFF047857)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        _AdminStatCard(
          label: "ABSENT",
          value: "${summary?.absent ?? 0}",
          gradient: const LinearGradient(
            colors: [Color(0xFFEF4444), Color(0xFFB91C1C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        _AdminStatCard(
          label: "LATE ARRIVALS",
          value: "${summary?.late ?? 0}",
          gradient: const LinearGradient(
            colors: [Color(0xFFF97316), Color(0xFFC2410C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        _AdminStatCard(
          label: "ON LEAVE",
          value: "${summary?.onLeave ?? 0}",
          gradient: const LinearGradient(
            colors: [Color(0xFFF59E0B), Color(0xFFB45309)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ],
    );
  }
}

class _AdminStatCard extends StatelessWidget {
  final String label;
  final String value;
  final LinearGradient gradient;

  const _AdminStatCard({
    required this.label,
    required this.value,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        gradient: gradient,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
          smoothness: 1,
        ),
        shadows: [
          BoxShadow(
            color: gradient.colors.last.withValues(alpha: 0.4),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: PlusJakartaSansFontPalette.base700(
              11,
              color: Colors.white.withValues(alpha: 0.9),
              letterSpacing: 1.2,
            ),
          ),
          4.verticalSpace,
          Text(
            value,
            style: PlusJakartaSansFontPalette.base700(36, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _AdminAttendanceStatsShimmer extends StatelessWidget {
  const _AdminAttendanceStatsShimmer();

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
            color: ColorPalette.white,
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(28.r),
              smoothness: 1,
            ),
          ),
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
        );
      }),
    );
  }
}
