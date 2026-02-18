import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../attendance/provider/attendance_provider.dart';

class AdminBranchSelector extends ConsumerWidget {
  const AdminBranchSelector({super.key});

  final List<String> _branches = const [
    "All Branches (UAE)",
    "All Branches (Oman)",
    "All Branches (Qatar)",
    "Dubai HQ",
    "Abu Dhabi",
    "Sharjah",
    "Ajman",
    "Fujairah",
  ];

  void _showBranchPicker(
    BuildContext context,
    WidgetRef ref,
    String currentBranch,
  ) {
    showModalBottomSheet(
      context: context,
      shape: SmoothRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        smoothness: 1,
      ),
      builder: (context) {
        return SmoothContainer(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          smoothness: 1,
          color: ColorPalette.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SELECT BRANCH / COUNTRY",
                style: PlusJakartaSansFontPalette.base700(
                  12,
                  color: const Color(0xFF94A3B8),
                  letterSpacing: 1.2,
                ),
              ),
              16.verticalSpace,
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ..._branches.map((branch) {
                        final isSelected = currentBranch == branch;
                        return InkWell(
                          onTap: () {
                            ref
                                .read(attendanceFilterProvider.notifier)
                                .setBranch(branch);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xFFF1F5F9),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  branch,
                                  style: PlusJakartaSansFontPalette.base700(
                                    16,
                                    color: isSelected
                                        ? const Color(0xFF1E40AF)
                                        : const Color(0xFF0F172A),
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    color: const Color(0xFF1E40AF),
                                    size: 20.sp,
                                  ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBranch = ref.watch(attendanceFilterProvider).branch;

    return GestureDetector(
      onTap: () => _showBranchPicker(context, ref, currentBranch),
      child: SmoothContainer(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        smoothness: 2,
        color: const Color(0XFFF8FAFC),
        borderRadius: BorderRadius.circular(16.r),
        child: Row(
          children: [
            Icon(
              Icons.filter_alt_outlined,
              color: const Color(0xFF94A3B8),
              size: 20.sp,
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Branch / Country",
                    style: PlusJakartaSansFontPalette.base700(
                      10,
                      color: const Color(0xFF94A3B8),
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    currentBranch,
                    style: PlusJakartaSansFontPalette.base700(
                      14,
                      color: ColorPalette.f101828,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}
