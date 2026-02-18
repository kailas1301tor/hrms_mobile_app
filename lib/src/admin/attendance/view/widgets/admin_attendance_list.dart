import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../provider/attendance_provider.dart';

class AdminAttendanceList extends ConsumerWidget {
  const AdminAttendanceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(attendanceFilterProvider);

    final List<Map<String, dynamic>> allItems = [
      {
        "name": "Ahmed Mansoor",
        "branch": "Dubai HQ",
        "status": "LATE",
        "displayStatus": "LATE ENTRY",
        "time": "08:15 AM",
        "initial": "A",
        "color": const Color(0XFFFFF7ED), // Light orange
        "textColor": const Color(0XFFC2410C),
        "isLate": true,
      },
      {
        "name": "Sarah Jenkins",
        "branch": "Abu Dhabi",
        "status": "ABSENT",
        "displayStatus": "ABSENT",
        "time": "-",
        "initial": "S",
        "color": const Color(0XFFFEF2F2), // Light red
        "textColor": const Color(0XFFEF4444),
        "isLate": false,
      },
      {
        "name": "Rajesh Kumar",
        "branch": "Sharjah",
        "status": "PRESENT",
        "displayStatus": "PRESENT",
        "time": "07:55 AM",
        "initial": "R",
        "color": const Color(0XFFF0FDF4), // Light green
        "textColor": const Color(0XFF15803D),
        "isLate": false,
      },
      {
        "name": "Fatima Al Ali",
        "branch": "Dubai HQ",
        "status": "LATE",
        "displayStatus": "LATE ENTRY",
        "time": "08:02 AM",
        "initial": "F",
        "color": const Color(0XFFFFF7ED),
        "textColor": const Color(0XFFC2410C),
        "isLate": true,
      },
    ];

    final filteredItems = allItems.where((item) {
      final matchesBranch =
          filterState.branch == "All Branches (UAE)" ||
          item["branch"] == filterState.branch;
      final matchesStatus =
          filterState.status == "ALL" || item["status"] == filterState.status;
      return matchesBranch && matchesStatus;
    }).toList();

    if (filteredItems.isEmpty) {
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

    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(24.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: filteredItems.length,
        separatorBuilder: (context, index) => Divider(
          color: const Color(0xFFF1F5F9),
          thickness: 1,
          indent: 16.w,
          endIndent: 16.w,
        ),
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          final isLate = item["status"] == "LATE";
          final isPresent = item["status"] == "PRESENT";

          return Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                SmoothContainer(
                  width: 52.w,
                  height: 52.w,
                  smoothness: 2,
                  color: item["color"] as Color,
                  borderRadius: BorderRadius.circular(16.r),
                  alignment: Alignment.center,
                  child: Text(
                    item["initial"] as String,
                    style: PlusJakartaSansFontPalette.base700(
                      20,
                      color: item["textColor"] as Color,
                    ),
                  ),
                ),
                16.horizontalSpace,
                // Name and Branch
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item["name"] as String,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: PlusJakartaSansFontPalette.base700(
                                17,
                                color: const Color(0xFF0F172A),
                              ),
                            ),
                          ),
                          if (isLate) ...[
                            6.horizontalSpace,
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Icon(
                                Icons.error_outline,
                                size: 16.sp,
                                color: const Color(0XFFF97316),
                              ),
                            ),
                            2.horizontalSpace,
                          ],
                        ],
                      ),
                      6.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16.sp,
                            color: const Color(0XFF94A3B8),
                          ),
                          4.horizontalSpace,
                          Expanded(
                            child: Text(
                              item["branch"] as String,
                              overflow: TextOverflow.ellipsis,
                              style: PlusJakartaSansFontPalette.base600(
                                13,
                                color: const Color(0XFF94A3B8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Status and Time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Status Badge
                    SmoothContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      smoothness: 2,
                      color: item["color"] as Color,
                      borderRadius: BorderRadius.circular(8.r),
                      child: Text(
                        item["displayStatus"] as String,
                        style: PlusJakartaSansFontPalette.base700(
                          10,
                          color: item["textColor"] as Color,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    12.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14.sp,
                          color: isPresent
                              ? const Color(0XFF22C55E)
                              : isLate
                              ? const Color(0XFFF97316)
                              : const Color(0XFF94A3B8),
                        ),
                        6.horizontalSpace,
                        Text(
                          item["time"] as String,
                          style: PlusJakartaSansFontPalette.base700(
                            13,
                            color: isPresent
                                ? const Color(0XFF22C55E)
                                : isLate
                                ? const Color(0XFFF97316)
                                : const Color(0XFF94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
