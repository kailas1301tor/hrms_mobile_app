import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../model/staff_attendance_response.dart';

class PulseHeaderCard extends StatelessWidget {
  final StaffAttendanceRecord? attendanceRecord;

  const PulseHeaderCard({super.key, this.attendanceRecord});

  @override
  Widget build(BuildContext context) {
    // Determine status and color
    String statusText = "Absent Today";
    Color statusIconColor = ColorPalette.fFF2727;
    String checkInTime = "-";
    String remarks = "";
    Color remarksColor = ColorPalette.white.withValues(alpha: 0.6);

    if (attendanceRecord != null) {
      if (attendanceRecord?.status == "Present") {
        statusText = "On-Duty Today";
        statusIconColor = ColorPalette.f1CB42F;
        checkInTime = attendanceRecord?.checkIn ?? "-";

        // Logic for Late/On-Time based on data or assumption.
        // The API returns "status": "Late" in summary but checkIn time in record.
        // If status in record is "Present", we check additional fields if available.
        // For now, using the record status or derivation.
        // The mock shows "15M LATE ENTRY" but API doesn't seem to have direct field for late duration in record
        // except possibly in 'editReason' or inferred.
        // We will display 'checkIn' time.
      } else {
        // Absent or other status
        statusText = "${attendanceRecord?.status ?? 'Absent'} Today";
        statusIconColor = (attendanceRecord?.status == 'On Leave')
            ? ColorPalette.fFF2727
            : ColorPalette.f1CB42F;
      }
    }

    return SmoothContainer(
      width: double.infinity,
      smoothness: 2,
      borderRadius: BorderRadius.circular(36.r),
      color: ColorPalette.primaryColor,
      child: Stack(
        children: [
          // Decoration Circle
          Positioned(
            right: -50.w,
            top: -50.h,
            child: Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPalette.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CHECK-IN STATUS",
                  style: PlusJakartaSansFontPalette.base700(
                    11,
                    color: ColorPalette.white.withValues(alpha: 0.6),
                    letterSpacing: 1.2,
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                        color: statusIconColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        statusText,
                        style: PlusJakartaSansFontPalette.fWhite_28_700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CHECK-IN TIME",
                            style: PlusJakartaSansFontPalette.base700(
                              11,
                              color: ColorPalette.white.withValues(alpha: 0.6),
                              letterSpacing: 1.2,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            checkInTime,
                            style: PlusJakartaSansFontPalette.fWhite_20_600,
                            overflow: TextOverflow.ellipsis,
                          ),
                          4.verticalSpace,
                          if (remarks.isNotEmpty)
                            Text(
                              remarks,
                              style: PlusJakartaSansFontPalette.base700(
                                11,
                                color: remarksColor,
                                letterSpacing: 0.5,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
