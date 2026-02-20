import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/admin/requests/model/leave_request_item.dart';
import 'package:smooth_corner/smooth_corner.dart';

class LeaveCard extends StatelessWidget {
  const LeaveCard({super.key, required this.item});

  final LeaveRequestItem item;

  Color _statusColor(String? status) {
    switch (status?.toUpperCase()) {
      case 'APPROVED':
        return const Color(0XFF3AB400);
      case 'REJECTED':
        return const Color(0XFFBD1A0F);
      default:
        return const Color(0XFFF6993F);
    }
  }

  Color _statusBgColor(String? status) {
    switch (status?.toUpperCase()) {
      case 'APPROVED':
        return const Color(0XFFE3FBE7);
      case 'REJECTED':
        return const Color(0XFFFCF3F1);
      default:
        return const Color(0XFFFFF7E6);
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = item.status ?? 'PENDING';
    final title = item.details?.leaveType ?? 'Leave';
    final days = item.details?.numberOfDays != null
        ? '${item.details!.numberOfDays} day(s)'
        : '';
    final subtitle = days.isNotEmpty ? days : (item.details?.reason ?? '');
    final dateStr = item.submittedAt != null && item.submittedAt!.isNotEmpty
        ? item.submittedAt!.split('T').first
        : '';

    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(30.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      padding: EdgeInsets.all(24.w),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: PlusJakartaSansFontPalette.base700(
                  12,
                  color: ColorPalette.primaryColorDark,
                  letterSpacing: 1.2,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _statusBgColor(status),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  status,
                  style: PlusJakartaSansFontPalette.base700(
                    11,
                    color: _statusColor(status),
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            subtitle,
            style: PlusJakartaSansFontPalette.base700(
              20,
              color: ColorPalette.primaryColorDark,
            ),
          ),
          20.verticalSpace,
          Divider(color: ColorPalette.fF0F0F0, thickness: 1.h),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REFERENCE #${item.requestId ?? ''}',
                style: PlusJakartaSansFontPalette.base700(
                  11,
                  color: ColorPalette.f99A1AF,
                  letterSpacing: 1.1,
                ),
              ),
              Text(
                dateStr,
                style: PlusJakartaSansFontPalette.base700(
                  11,
                  color: ColorPalette.f99A1AF,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
