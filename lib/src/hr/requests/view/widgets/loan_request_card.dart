import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../model/loan_request_item.dart';

import 'hr_request_card_common.dart';

class LoanRequestCard extends StatelessWidget {
  const LoanRequestCard({
    super.key,
    required this.request,
    required this.onApprove,
    required this.onReject,
  });

  final LoanRequestItem request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  String get _amount => request.amount ?? '';

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
    return HrRequestCardBase(
      name: request.userId?.name ?? '',
      requestId: request.requestId ?? '',
      dateStr: _dateStr,
      reason: request.reason ?? '',
      status: request.status ?? 'PENDING',
      typeLabel: 'Loan',
      onApprove: onApprove,
      onReject: onReject,
      middleSection: _amount.isEmpty
          ? null
          : SmoothContainer(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              smoothness: 2,
              color: const Color(0XFFF8FAFC),
              borderRadius: BorderRadius.circular(12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'REQUESTED AMOUNT',
                    style: PlusJakartaSansFontPalette.base700(
                      10,
                      color: ColorPalette.f99A1AF,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    'AED $_amount',
                    style: PlusJakartaSansFontPalette.base700(
                      16,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
