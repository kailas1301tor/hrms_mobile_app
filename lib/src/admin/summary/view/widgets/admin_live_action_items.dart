import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../notifier/summary_notifier.dart';

class AdminLiveActionItems extends ConsumerWidget {
  const AdminLiveActionItems({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryState = ref.watch(
      summaryProvider.select((s) => (s.pendingApprovals, s.error, s.isLoading)),
    );
    final pendingApprovals = summaryState.$1?.data ?? [];

    if (summaryState.$3 && summaryState.$1 == null) {
      return const _LiveActionItemsShimmer();
    }

    return SmoothContainer(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      smoothness: 2,
      borderRadius: BorderRadius.circular(24.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "LIVE ACTION ITEMS",
                style: PlusJakartaSansFontPalette.base700(
                  12,
                  color: const Color(0xFF94A3B8),
                  letterSpacing: 1.2,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "VIEW ALL",
                  style: PlusJakartaSansFontPalette.base700(
                    11,
                    color: const Color(0xFF1E40AF),
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
          24.verticalSpace,
          if (pendingApprovals.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text(
                "No pending actions found",
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: const Color(0xFF94A3B8),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pendingApprovals.length,
              separatorBuilder: (context, index) => Divider(
                color: const Color(0xFFF1F5F9),
                height: 32.h,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                final item = pendingApprovals[index];
                final String name = item.userId?.name ?? "Unknown";
                final String initial = name.isNotEmpty
                    ? name[0].toUpperCase()
                    : "?";
                final String type = item.requestType ?? "-";

                // Mapping types to colors for a varied look
                Color bgColor = const Color(0XFFEFF6FF);
                Color textColor = const Color(0XFF1D4ED8);

                if (type == 'LEAVE') {
                  bgColor = const Color(0XFFEFF6FF);
                  textColor = const Color(0XFF1D4ED8);
                } else if (type == 'SALARY') {
                  bgColor = const Color(0XFFF0FDF4);
                  textColor = const Color(0XFF15803D);
                } else {
                  bgColor = const Color(0XFFF5F3FF);
                  textColor = const Color(0XFF7E22CE);
                }

                return Row(
                  children: [
                    SmoothContainer(
                      width: 44.w,
                      height: 44.w,
                      smoothness: 2,
                      color: bgColor,
                      borderRadius: BorderRadius.circular(14.r),
                      alignment: Alignment.center,
                      child: Text(
                        initial,
                        style: PlusJakartaSansFontPalette.base700(
                          18,
                          color: textColor,
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: PlusJakartaSansFontPalette.base700(
                              16,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          6.verticalSpace,
                          Text(
                            type,
                            style: PlusJakartaSansFontPalette.base700(
                              10,
                              color: const Color(0xFF64748B),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SmoothContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      smoothness: 2,
                      color: const Color(0XFFFFF7ED),
                      borderRadius: BorderRadius.circular(8.r),
                      child: Text(
                        item.status ?? '-',
                        style: PlusJakartaSansFontPalette.base700(
                          10,
                          color: const Color(0XFFC2410C),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}

class _LiveActionItemsShimmer extends StatelessWidget {
  const _LiveActionItemsShimmer();

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      smoothness: 2,
      borderRadius: BorderRadius.circular(24.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE2E8F0),
        highlightColor: const Color(0xFFF8FAFC),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 120.w, height: 12.h, color: Colors.white),
                Container(width: 50.w, height: 12.h, color: Colors.white),
              ],
            ),
            24.verticalSpace,
            ...List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: index == 2 ? 0 : 24.h),
                child: Row(
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.w,
                            height: 16.h,
                            color: Colors.white,
                          ),
                          8.verticalSpace,
                          Container(
                            width: 60.w,
                            height: 10.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
