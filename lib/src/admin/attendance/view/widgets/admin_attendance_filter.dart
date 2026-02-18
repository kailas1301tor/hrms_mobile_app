import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../../res/styles/color_palette.dart';
import '../../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../provider/attendance_provider.dart';
import '../../../common/widgets/admin_branch_selector.dart';

class AdminAttendanceFilter extends ConsumerStatefulWidget {
  const AdminAttendanceFilter({super.key});

  @override
  ConsumerState<AdminAttendanceFilter> createState() =>
      _AdminAttendanceFilterState();
}

class _AdminAttendanceFilterState extends ConsumerState<AdminAttendanceFilter> {
  final List<String> _filters = ["ALL", "PRESENT", "ABSENT", "LATE"];

  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(attendanceFilterProvider);

    return Column(
      children: [
        const AdminBranchSelector(),
        16.verticalSpace,
        // Status Filter Chips
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _filters.map((filter) {
            final isSelected = filterState.status == filter;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: filter == "LATE" ? 0 : 8.w),
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(attendanceFilterProvider.notifier)
                        .setStatus(filter);
                  },
                  child: SmoothContainer(
                    smoothness: 2,
                    height: 48.h,
                    color: isSelected
                        ? const Color(0xFF1E40AF)
                        : const Color(0XFFF8FAFC),
                    borderRadius: BorderRadius.circular(16.r),
                    alignment: Alignment.center,
                    child: Text(
                      filter,
                      style: PlusJakartaSansFontPalette.base700(
                        12,
                        color: isSelected
                            ? ColorPalette.white
                            : const Color(0XFF64748B),
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
