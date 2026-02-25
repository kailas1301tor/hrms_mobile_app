import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../main/view/main_screen.dart';
import '../../../track/view/track_screen.dart';

class PulseQuickActions extends ConsumerWidget {
  const PulseQuickActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionItem(
            icon: Icons.calendar_today_outlined,
            label: "LEAVE",
            iconColor: ColorPalette.fE53B40,
            backgroundColor: ColorPalette.fFEF2F2,
            onTap: () {
              ref.read(selectedTabProvider.notifier).set(1);
            },
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: _QuickActionItem(
            icon: Icons.account_balance_wallet_outlined,
            label: "ADVANCE",
            iconColor: ColorPalette.primaryColor,
            backgroundColor: ColorPalette.fEEF3FF,
            onTap: () {
              ref.read(selectedTabProvider.notifier).set(1);
              selectedIndex.value = 1;
            },
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: _QuickActionItem(
            icon: Icons.verified_user_outlined,
            label: "LOAN",
            iconColor: ColorPalette.f344054,
            backgroundColor: ColorPalette.fF6F6F6,
            onTap: () {
              ref.read(selectedTabProvider.notifier).set(1);
              selectedIndex.value = 2;
            },
          ),
        ),
      ],
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _QuickActionItem({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SmoothContainer(
        smoothness: 2,
        borderRadius: BorderRadius.circular(24.r),
        color: ColorPalette.white,
        side: BorderSide(
          color: ColorPalette.primaryColor.withValues(alpha: 0.1),
          width: 1.5.w,
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24.sp),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                label,
                style: PlusJakartaSansFontPalette.base700(
                  12,
                  color: ColorPalette.loginBackground,
                  letterSpacing: 1.0,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
