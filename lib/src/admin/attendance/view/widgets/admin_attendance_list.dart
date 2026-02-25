import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../../../res/enums/enums.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hrms_mobile/src/admin/attendance/notifier/attendance_notifier.dart';

class AdminAttendanceList extends ConsumerWidget {
  const AdminAttendanceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState = ref.watch(
      attendanceProvider.select(
        (s) => (s.records, s.error, s.loaderState, s.isLoadMore),
      ),
    );
    final records = attendanceState.$1;

    if (attendanceState.$3 == LoaderState.loading && records.isEmpty) {
      return const _AttendanceListShimmer();
    }

    if (records.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h),
          child: Column(
            children: [
              Icon(
                Icons.person_off_outlined,
                size: 48.sp,
                color: ColorPalette.coolGray,
              ),
              12.verticalSpace,
              Text(
                "No records found for this selection",
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.coolGray,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        SmoothContainer(
          smoothness: 2,
          borderRadius: BorderRadius.circular(24.r),
          color: ColorPalette.white,
          side: BorderSide(
            color: ColorPalette.primaryColor.withValues(alpha: 0.1),
            width: 1.5.w,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.w),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: records.length,
            separatorBuilder: (context, index) => Divider(
              color: const Color(0xFFF1F5F9),
              thickness: 1,
              height: 24.h,
            ),
            itemBuilder: (context, index) {
              final item = records[index];
              final String status = (item.status ?? "ABSENT").toUpperCase();
              final String checkIn = item.checkIn ?? "-";

              Color bgColor = const Color(0XFFFEF2F2);
              Color textColor = const Color(0XFFEF4444);
              bool isLate = status == 'LATE';
              bool isPresent = status == 'PRESENT';

              if (isPresent) {
                bgColor = const Color(0XFFF0FDF4);
                textColor = const Color(0XFF15803D);
              } else if (isLate) {
                bgColor = const Color(0XFFFFF7ED);
                textColor = const Color(0XFFC2410C);
              } else if (status == 'ABSENT') {
                bgColor = const Color(0XFFFEF2F2);
                textColor = const Color(0XFFEF4444);
              } else if (status == 'ON LEAVE' || status == 'ON_LEAVE') {
                bgColor = const Color(0XFFF5F3FF);
                textColor = const Color(0XFF7E22CE);
              }

              final String name = item.name ?? "Unknown";
              final String initial = name.isNotEmpty
                  ? name[0].toUpperCase()
                  : "?";
              final String branch = _formatBranch(item.branch, item.department);

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothContainer(
                    width: 52.w,
                    height: 52.w,
                    smoothness: 2,
                    color: bgColor,
                    borderRadius: BorderRadius.circular(16.r),
                    alignment: Alignment.center,
                    child: Text(
                      initial,
                      style: PlusJakartaSansFontPalette.base700(
                        20,
                        color: textColor,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: PlusJakartaSansFontPalette.base700(
                                  16,
                                  color: const Color(0xFF0F172A),
                                ),
                              ),
                            ),
                            if (isLate) ...[
                              6.horizontalSpace,
                              Icon(
                                Icons.error_outline,
                                size: 14.sp,
                                color: const Color(0XFFF97316),
                              ),
                            ],
                          ],
                        ),
                        4.verticalSpace,
                        Text(
                          branch,
                          style: PlusJakartaSansFontPalette.base600(
                            12,
                            color: const Color(0XFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SmoothContainer(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        smoothness: 2,
                        color: bgColor,
                        borderRadius: BorderRadius.circular(6.r),
                        child: Text(
                          status,
                          style: PlusJakartaSansFontPalette.base700(
                            9,
                            color: textColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined, size: 13.sp),
                          4.horizontalSpace,
                          Text(
                            checkIn,
                            style: PlusJakartaSansFontPalette.base700(
                              12,
                              color: const Color(0XFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
        if (attendanceState.$4)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }

  String _formatBranch(String? branch, String? department) {
    final bool hasBranch = branch != null && branch.isNotEmpty;
    final bool hasDept = department != null && department.isNotEmpty;

    if (hasBranch && hasDept) {
      return "$branch \u2022 $department";
    }
    if (hasBranch) return branch;
    if (hasDept) return department;
    return "-";
  }
}

class _AttendanceListShimmer extends StatelessWidget {
  const _AttendanceListShimmer();

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(24.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      padding: EdgeInsets.all(16.w),
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE2E8F0),
        highlightColor: const Color(0xFFF8FAFC),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          separatorBuilder: (context, index) => Divider(
            color: const Color(0xFFF1F5F9),
            thickness: 1,
            height: 24.h,
          ),
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothContainer(
                  width: 52.w,
                  height: 52.w,
                  smoothness: 2,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      8.verticalSpace,
                      Container(
                        width: 80.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 45.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                    8.verticalSpace,
                    Container(
                      width: 35.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
