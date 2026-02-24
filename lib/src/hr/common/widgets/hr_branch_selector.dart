import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../../utils/helpers/extensions.dart';
import '../../../../res/enums/enums.dart';
import '../../attendance/notifier/attendance_notifier.dart';

class HrBranchSelector extends ConsumerWidget {
  const HrBranchSelector({super.key});

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
          child: Consumer(
            builder: (context, ref, child) {
              final branchState = ref.watch(hrAttendanceProvider);
              final branches = branchState.branches;

              return Column(
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
                  if (branchState.branchLoaderState == LoaderState.loading)
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            5,
                            (index) => Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ).showGradientShimmer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  else if (branchState.branchLoaderState == LoaderState.error)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Center(child: Text("Error fetching branches")),
                    )
                  else if (branches.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.h),
                      child: Center(
                        child: Text(
                          "No branches found",
                          style: PlusJakartaSansFontPalette.base700(
                            14,
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                      ),
                    )
                  else
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...branches.map((branch) {
                              final isSelected = currentBranch == branch;
                              return InkWell(
                                onTap: () {
                                  ref
                                      .read(hrAttendanceProvider.notifier)
                                      .updateBranch(branch);
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        branch,
                                        style:
                                            PlusJakartaSansFontPalette.base700(
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
                            }),
                          ],
                        ),
                      ),
                    ),
                  20.verticalSpace,
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState = ref.watch(hrAttendanceProvider);
    final currentBranch = attendanceState.branch;

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
                  if (attendanceState.branchLoaderState == LoaderState.loading)
                    Container(
                      width: 120.w,
                      height: 16.h,
                      margin: EdgeInsets.only(top: 4.h),
                      decoration: BoxDecoration(
                        color: ColorPalette.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ).showGradientShimmer()
                  else
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
