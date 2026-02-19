import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../model/leave_request_item.dart';

import 'admin_request_card_common.dart';

class LeaveRequestCard extends StatelessWidget {
  const LeaveRequestCard({
    super.key,
    required this.request,
    required this.onApprove,
    required this.onReject,
  });

  final LeaveRequestItem request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  String get _typeLabel => request.details?.leaveType ?? 'Leave';
  String get _numberOfDays => request.details?.numberOfDays ?? '';
  String get _fromDate => request.details?.fromDate ?? '';
  String get _toDate => request.details?.toDate ?? '';

  String get _dateStr {
    if (request.submittedAt == null) return '';
    try {
      return DateTime.parse(request.submittedAt!).toIso8601String().substring(0, 10);
    } catch (_) {
      return request.submittedAt ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminRequestCardBase(
      name: request.userId?.name ?? '',
      requestId: request.requestId ?? '',
      dateStr: _dateStr,
      reason: request.details?.reason ?? '',
      status: request.status ?? 'PENDING',
      typeLabel: _typeLabel,
      onApprove: onApprove,
      onReject: onReject,
      middleSection: (_numberOfDays.isNotEmpty ||
              _fromDate.isNotEmpty ||
              _toDate.isNotEmpty)
          ? SmoothContainer(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              smoothness: 2,
              color: const Color(0XFFF8FAFC),
              borderRadius: BorderRadius.circular(12.r),
              child: Row(
                children: [
                  if (_numberOfDays.isNotEmpty)
                    Text(
                      _numberOfDays == '1' ? '1 day' : '$_numberOfDays days',
                      style: PlusJakartaSansFontPalette.base700(
                        12,
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                  if (_numberOfDays.isNotEmpty &&
                      (_fromDate.isNotEmpty || _toDate.isNotEmpty))
                    Text(
                      ' · ',
                      style: PlusJakartaSansFontPalette.base600(
                        12,
                        color: ColorPalette.f6C7278,
                      ),
                    ),
                  if (_fromDate.isNotEmpty || _toDate.isNotEmpty)
                    Expanded(
                      child: Text(
                        _fromDate == _toDate || _toDate.isEmpty
                            ? _fromDate
                            : '$_fromDate to $_toDate',
                        style: PlusJakartaSansFontPalette.base600(
                          12,
                          color: ColorPalette.f6C7278,
                        ),
                      ),
                    ),
                ],
              ),
            )
          : null,
    );
  }
}
