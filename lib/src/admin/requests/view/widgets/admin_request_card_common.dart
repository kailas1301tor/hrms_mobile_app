import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

/// Shared card frame: left status bar, avatar/name/labor id, type label, date,
/// [middleSection], reason, status badge and action buttons.
class AdminRequestCardBase extends StatelessWidget {
  const AdminRequestCardBase({
    super.key,
    required this.name,
    required this.requestId,
    required this.dateStr,
    required this.reason,
    required this.status,
    required this.typeLabel,
    required this.onApprove,
    required this.onReject,
    this.middleSection,
  });

  final String name;
  final String requestId;
  final String dateStr;
  final String reason;
  final String status;
  final String typeLabel;
  final VoidCallback onApprove;
  final VoidCallback onReject;
  final Widget? middleSection;

  String get _initial => name.isNotEmpty ? name[0].toUpperCase() : '';
  bool get _isApproved => status == 'APPROVED';
  bool get _isPending => status == 'PENDING';

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      margin: EdgeInsets.only(bottom: 16.h),
      smoothness: 2,
      borderRadius: BorderRadius.circular(20.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: ColorPalette.primaryColor.withValues(alpha: 0.1),
        width: 1.5.w,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.w),
              width: 10.w,
              decoration: BoxDecoration(
                color: _isApproved
                    ? const Color(0XFF22C55E)
                    : const Color(0XFFF97316),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  bottomLeft: Radius.circular(40.r),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    if (middleSection != null) ...[
                      16.verticalSpace,
                      middleSection!,
                    ],
                    16.verticalSpace,
                    Text(
                      '"$reason"',
                      style: PlusJakartaSansFontPalette.base600(
                        13,
                        color: ColorPalette.f6C7278,
                      ).copyWith(fontStyle: FontStyle.italic),
                    ),
                    16.verticalSpace,
                    _buildStatusRow(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmoothContainer(
          width: 44.w,
          height: 44.w,
          smoothness: 2,
          color: const Color(0XFFF3F4F6),
          borderRadius: BorderRadius.circular(12.r),
          alignment: Alignment.center,
          child: Text(
            _initial,
            style: PlusJakartaSansFontPalette.base700(
              18,
              color: ColorPalette.primaryColor,
            ),
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: PlusJakartaSansFontPalette.base700(
                  16,
                  color: ColorPalette.f101828,
                ),
              ),
              2.verticalSpace,
              Text(
                'LABOR ID: $requestId',
                style: PlusJakartaSansFontPalette.base600(
                  10,
                  color: ColorPalette.f99A1AF,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        4.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              typeLabel,
              style: PlusJakartaSansFontPalette.base700(
                14,
                color: ColorPalette.primaryColor,
              ),
            ),
            Text(
              dateStr,
              style: PlusJakartaSansFontPalette.base600(
                12,
                color: ColorPalette.f99A1AF,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothContainer(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          smoothness: 2,
          color: _isApproved ? const Color(0XFFE8FBF0) : const Color(0XFFFFF7ED),
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(
            color: _isApproved ? const Color(0XFFDCFCE7) : const Color(0XFFFFEDD5),
            width: 1,
          ),
          child: Text(
            status,
            style: PlusJakartaSansFontPalette.base700(
              10,
              color: _isApproved ? const Color(0XFF15803D) : const Color(0XFFC2410C),
              letterSpacing: 1.0,
            ),
          ),
        ),
        if (_isPending)
          Row(
            children: [
              AdminRequestActionButton(
                icon: Icons.close,
                color: const Color(0XFFFEF2F2),
                iconColor: const Color(0XFFEF4444),
                onTap: onReject,
              ),
              12.horizontalSpace,
              AdminRequestActionButton(
                icon: Icons.check,
                color: ColorPalette.primaryColor,
                iconColor: ColorPalette.white,
                onTap: onApprove,
              ),
            ],
          ),
      ],
    );
  }
}

class AdminRequestActionButton extends StatelessWidget {
  const AdminRequestActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SmoothContainer(
        width: 40.w,
        height: 40.w,
        smoothness: 2,
        color: color,
        borderRadius: BorderRadius.circular(10.r),
        side: color == const Color(0XFFFEF2F2)
            ? const BorderSide(color: Color(0XFFFEE2E2), width: 1)
            : BorderSide.none,
        alignment: Alignment.center,
        child: Icon(icon, color: iconColor, size: 20.sp),
      ),
    );
  }
}
