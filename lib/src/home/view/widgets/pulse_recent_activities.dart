import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class PulseRecentActivities extends StatelessWidget {
  const PulseRecentActivities({super.key});

  static const List<Map<String, dynamic>> _mockActivities = [
    {
      "title": "Annual Leave",
      "date": "2024-05-20",
      "status": "PENDING",
      "icon": Icons.access_time_rounded,
    },
    {
      "title": "Salary Advance",
      "date": "2024-05-18",
      "status": "APPROVED",
      "icon": Icons.payments_outlined,
    },
    {
      "title": "Expense Claim",
      "date": "2024-05-15",
      "status": "PROCESS",
      "icon": Icons.receipt_long_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RECENT ACTIVITIES",
          style: PlusJakartaSansFontPalette.base700(
            12,
            color: ColorPalette.f99A1AF,
            letterSpacing: 1.2,
          ),
        ),
        16.verticalSpace,
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: _mockActivities.length,
          separatorBuilder: (context, index) => 12.verticalSpace,
          itemBuilder: (context, index) {
            final activity = _mockActivities[index];
            return ActivitySmoothCard(
              title: activity["title"],
              date: activity["date"],
              status: activity["status"],
              icon: activity["icon"],
            );
          },
        ),
      ],
    );
  }
}

class ActivitySmoothCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final IconData icon;

  const ActivitySmoothCard({
    super.key,
    required this.title,
    required this.date,
    required this.status,
    required this.icon,
  });

  Color _getStatusColor(String status) {
    switch (status) {
      case "APPROVED":
        return ColorPalette.f1CB42F;
      case "REJECTED":
        return ColorPalette.fE53B40;
      case "PROCESS":
        return ColorPalette.primaryColor;
      case "PENDING":
        return const Color(0XFFF6993F);
      default:
        return ColorPalette.fED6802;
    }
  }

  Color _getStatusBgColor(String status) {
    if (status == "PENDING") return const Color(0XFFFFF7E6);
    return _getStatusColor(status).withValues(alpha: 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(30.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      padding: EdgeInsets.all(20.r),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: ColorPalette.fEEF3FF,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: ColorPalette.primaryColor, size: 20.sp),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: PlusJakartaSansFontPalette.fBlack_16_700,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  date,
                  style: PlusJakartaSansFontPalette.base700(
                    11,
                    color: ColorPalette.fB0B0B0,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: _getStatusBgColor(status),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              status,
              style: PlusJakartaSansFontPalette.base700(
                10,
                color: _getStatusColor(status),
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
