import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class AdminRequestCard extends StatelessWidget {
  final Map<String, dynamic> request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const AdminRequestCard({
    super.key,
    required this.request,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final String type = request["type"]; // LEAVE, ADVANCE, LOAN
    final bool isApproved = request["status"] == "APPROVED";
    final bool isPending = request["status"] == "PENDING";
    final bool hasAmount = type == "ADVANCE" || type == "LOAN";

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
            // Left Status Indicator
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.w),
              width: 10.w,
              decoration: BoxDecoration(
                color: isApproved
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
                    // Header: Avatar, Name, Info, Type
                    Row(
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
                            request["initial"] as String,
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
                                request["name"] as String,
                                // request["name"] as String,
                                style: PlusJakartaSansFontPalette.base700(
                                  16,
                                  color: ColorPalette.f101828,
                                ),
                              ),
                              2.verticalSpace,
                              Text(
                                "LABOR ID: ${request["id"]} • ${request["branch"]}",
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
                              request["requestType"] as String,
                              style: PlusJakartaSansFontPalette.base700(
                                14,
                                color: ColorPalette.primaryColor,
                              ),
                            ),
                            Text(
                              request["date"] as String,
                              style: PlusJakartaSansFontPalette.base600(
                                12,
                                color: ColorPalette.f99A1AF,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    if (hasAmount) ...[
                      16.verticalSpace,
                      SmoothContainer(
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
                              "REQUESTED AMOUNT",
                              style: PlusJakartaSansFontPalette.base700(
                                10,
                                color: ColorPalette.f99A1AF,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              "AED ${request["amount"]}",
                              style: PlusJakartaSansFontPalette.base700(
                                16,
                                color: ColorPalette.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    16.verticalSpace,
                    Text(
                      "\"${request["reason"]}\"",
                      style: PlusJakartaSansFontPalette.base600(
                        13,
                        color: ColorPalette.f6C7278,
                      ).copyWith(fontStyle: FontStyle.italic),
                    ),

                    16.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Status Badge
                        SmoothContainer(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          smoothness: 2,
                          color: isApproved
                              ? const Color(0XFFE8FBF0)
                              : const Color(0XFFFFF7ED),
                          borderRadius: BorderRadius.circular(8.r),
                          side: BorderSide(
                            color: isApproved
                                ? const Color(0XFFDCFCE7)
                                : const Color(0XFFFFEDD5),
                            width: 1,
                          ),
                          child: Text(
                            request["status"] as String,
                            style: PlusJakartaSansFontPalette.base700(
                              10,
                              color: isApproved
                                  ? const Color(0XFF15803D)
                                  : const Color(0XFFC2410C),
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),

                        if (isPending)
                          Row(
                            children: [
                              _ActionButton(
                                icon: Icons.close,
                                color: const Color(0XFFFEF2F2),
                                iconColor: const Color(0XFFEF4444),
                                onTap: onReject,
                              ),
                              12.horizontalSpace,
                              _ActionButton(
                                icon: Icons.check,
                                color: ColorPalette.primaryColor,
                                iconColor: ColorPalette.white,
                                onTap: onApprove,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

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
