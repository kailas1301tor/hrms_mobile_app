import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:hrms_mobile/res/constants/string_constants.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomDateRangePickerDialog extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  const CustomDateRangePickerDialog({
    super.key,
    this.initialStartDate,
    this.initialEndDate,
  });

  @override
  State<CustomDateRangePickerDialog> createState() =>
      _CustomDateRangePickerDialogState();
}

class _CustomDateRangePickerDialogState
    extends State<CustomDateRangePickerDialog> {
  late DateTime _focusedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialStartDate ?? DateTime.now();
    _rangeStart = widget.initialStartDate;
    _rangeEnd = widget.initialEndDate;
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _rangeStart = start;
      _rangeEnd = end;
      _focusedDay = focusedDay;
    });
  }

  String _formatRange() {
    if (_rangeStart == null) return "Select Range";
    final start = DateFormat('MMM dd, yyyy').format(_rangeStart!);
    if (_rangeEnd != null) {
      final end = DateFormat('MMM dd, yyyy').format(_rangeEnd!);
      return "$start - $end";
    }
    return start;
  }

  @override
  Widget build(BuildContext context) {
    final hasFilter =
        widget.initialStartDate != null || widget.initialEndDate != null;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Date Range",
                        style: PlusJakartaSansFontPalette.fWhite_16_500
                            .copyWith(fontSize: 12.sp)
                            .copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                      ),
                      4.verticalSpace,
                      Text(
                        _formatRange(),
                        style: PlusJakartaSansFontPalette.fBlack_18_600
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.calendar_today, color: Colors.white, size: 24.sp),
              ],
            ),
          ),

          // Calendar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
            child: TableCalendar(
              firstDay: DateTime(2020),
              lastDay: DateTime(2030),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_rangeStart, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: CalendarFormat.month,
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              onRangeSelected: _onRangeSelected,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: PlusJakartaSansFontPalette.fBlack_16_600,
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: ColorPalette.primaryColor,
                  size: 24.sp,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: ColorPalette.primaryColor,
                  size: 24.sp,
                ),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: ColorPalette.primaryColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: ColorPalette.primaryColor.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                rangeStartDecoration: const BoxDecoration(
                  color: ColorPalette.primaryColor,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: ColorPalette.primaryColor,
                  shape: BoxShape.circle,
                ),
                rangeHighlightColor: ColorPalette.primaryColor.withValues(
                  alpha: 0.1,
                ),
                withinRangeTextStyle: PlusJakartaSansFontPalette.fBlack_14_600
                    .copyWith(color: ColorPalette.primaryColor),
              ),
            ),
          ),

          const Divider(height: 1),

          // Actions
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (hasFilter)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(
                        DateTimeRange(
                          start: DateTime(1900),
                          end: DateTime(1900),
                        ),
                      );
                    },
                    child: Text(
                      "Clear Filter",
                      style: PlusJakartaSansFontPalette.fBlack_14_600.copyWith(
                        color: ColorPalette.fE53B40,
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        Strings.cancel,
                        style: PlusJakartaSansFontPalette.fBlack_14_600
                            .copyWith(color: ColorPalette.f6A7282),
                      ),
                    ),
                    8.horizontalSpace,
                    TextButton(
                      onPressed: () {
                        if (_rangeStart != null) {
                          Navigator.of(context).pop(
                            DateTimeRange(
                              start: _rangeStart!,
                              end: _rangeEnd ?? _rangeStart!,
                            ),
                          );
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        Strings.ok,
                        style: PlusJakartaSansFontPalette.fBlack_14_600
                            .copyWith(color: ColorPalette.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
