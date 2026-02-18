import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class AdminLiveActionItems extends StatelessWidget {
  const AdminLiveActionItems({super.key});

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
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => Divider(
              color: const Color(0xFFF1F5F9),
              height: 32.h,
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              final items = [
                {
                  "name": "Ahmed Mansoor",
                  "type": "ANNUAL LEAVE",
                  "initial": "A",
                  "color": const Color(0XFFEFF6FF),
                  "textColor": const Color(0XFF1D4ED8),
                },
                {
                  "name": "Sarah Jenkins",
                  "type": "SALARY ADVANCE",
                  "initial": "S",
                  "color": const Color(0XFFF0FDF4),
                  "textColor": const Color(0XFF15803D),
                },
                {
                  "name": "Rajesh Kumar",
                  "type": "PERSONAL LOAN",
                  "initial": "R",
                  "color": const Color(0XFFF5F3FF),
                  "textColor": const Color(0XFF7E22CE),
                },
              ];
              final item = items[index];
              return Row(
                children: [
                  SmoothContainer(
                    width: 44.w,
                    height: 44.w,
                    smoothness: 2,
                    color: item["color"] as Color,
                    borderRadius: BorderRadius.circular(14.r),
                    alignment: Alignment.center,
                    child: Text(
                      item['initial'] as String,
                      style: PlusJakartaSansFontPalette.base700(
                        18,
                        color: item['textColor'] as Color,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'] as String,
                          style: PlusJakartaSansFontPalette.base700(
                            16,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        6.verticalSpace,
                        Text(
                          item['type'] as String,
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
                      "REVIEWING",
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
