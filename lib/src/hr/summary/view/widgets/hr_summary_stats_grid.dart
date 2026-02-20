import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../notifier/summary_notifier.dart';

class HrSummaryStatsGrid extends ConsumerWidget {
  const HrSummaryStatsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryState = ref.watch(
      hrSummaryProvider.select((s) => (s.stats, s.error, s.isLoading)),
    );
    final stats = summaryState.$1;

    if (summaryState.$3 && stats == null) {
      return const _HrStatsShimmer();
    }

    if (summaryState.$2 != null && stats == null) {
      return Center(
        child: Text(
          summaryState.$2 ?? 'Something went wrong',
          style: PlusJakartaSansFontPalette.base600(14, color: Colors.red),
        ),
      );
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
          value: "${stats?.present ?? 0}",
          stripeColor: ColorPalette.primaryColor,
          valueColor: ColorPalette.primaryColor,
        ),
        _HrStatCard(
          label: "ABSENT",
          value: "${stats?.absent ?? 0}",
          stripeColor: ColorPalette.fFF0000,
          valueColor: ColorPalette.fFF0000,
        ),
        _HrStatCard(
          label: "LATE ARRIVALS",
          value: "${stats?.late ?? 0}",
          stripeColor: ColorPalette.fFF7C34,
          valueColor: ColorPalette.fFF7C34,
        ),
        _HrStatCard(
          label: "PENDING",
          value: "${stats?.pendingRequests ?? 0}",
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

class _HrStatsShimmer extends StatelessWidget {
  const _HrStatsShimmer();

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
        return SmoothContainer(
          smoothness: 1,
          borderRadius: BorderRadius.circular(28.r),
          color: const Color(0xFFF1F5F9),
          child: Shimmer.fromColors(
            baseColor: const Color(0xFFE2E8F0),
            highlightColor: const Color(0xFFF8FAFC),
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
