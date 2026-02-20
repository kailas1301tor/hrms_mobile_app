import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/track/model/leave_type_item.dart';
import 'package:hrms_mobile/src/track/notifier/track_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/normal_text_form_field.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';

class NewLeaveRequestDialog extends ConsumerStatefulWidget {
  const NewLeaveRequestDialog({super.key});

  @override
  ConsumerState<NewLeaveRequestDialog> createState() =>
      _NewLeaveRequestDialogState();
}

class _NewLeaveRequestDialogState extends ConsumerState<NewLeaveRequestDialog> {
  static const int _maxReasonLength = 300;

  final _reasonController = TextEditingController();
  final _selectedLeaveType = ValueNotifier<LeaveTypeItem?>(null);
  final _fromDate = ValueNotifier<DateTime?>(null);
  final _toDate = ValueNotifier<DateTime?>(null);
  final _leaveTypeError = ValueNotifier<String?>(null);
  final _fromDateError = ValueNotifier<String?>(null);
  final _toDateError = ValueNotifier<String?>(null);
  final _reasonError = ValueNotifier<String?>(null);

  void _clearErrors() {
    _leaveTypeError.value = null;
    _fromDateError.value = null;
    _toDateError.value = null;
    _reasonError.value = null;
  }

  @override
  void dispose() {
    _reasonController.dispose();
    _selectedLeaveType.dispose();
    _fromDate.dispose();
    _toDate.dispose();
    _leaveTypeError.dispose();
    _fromDateError.dispose();
    _toDateError.dispose();
    _reasonError.dispose();
    super.dispose();
  }

  int? _numberOfDays(DateTime? from, DateTime? to) {
    if (from == null || to == null) return null;
    if (to.isBefore(from)) return null;
    return to.difference(from).inDays + 1;
  }

  String _formatDate(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickFromDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _fromDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (picked != null) {
      _fromDate.value = picked;
      _fromDateError.value = null;
    }
  }

  Future<void> _pickToDate() async {
    final initial = _toDate.value ?? _fromDate.value ?? DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: _fromDate.value ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (picked != null) {
      _toDate.value = picked;
      _toDateError.value = null;
    }
  }

  bool _validate() {
    _clearErrors();
    var valid = true;
    if (_selectedLeaveType.value == null) {
      _leaveTypeError.value = 'Please select a leave type';
      valid = false;
    }
    if (_fromDate.value == null) {
      _fromDateError.value = 'Please select from date';
      valid = false;
    }
    if (_toDate.value == null) {
      _toDateError.value = 'Please select to date';
      valid = false;
    }
    if (_fromDate.value != null &&
        _toDate.value != null &&
        _toDate.value!.isBefore(_fromDate.value!)) {
      _toDateError.value = 'To date must be on or after from date';
      valid = false;
    }
    final reason = _reasonController.text.trim();
    if (reason.isEmpty) {
      _reasonError.value = 'Reason is required';
      valid = false;
    } else if (reason.length > _maxReasonLength) {
      _reasonError.value =
          'Reason must be $_maxReasonLength characters or less';
      valid = false;
    }
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(trackProvider.notifier);
    final state = ref.watch(trackProvider);
    final leaveTypes = state.leaveTypes ?? [];
    final createLoader = state.createRequestLoader;

    final viewInsets = MediaQuery.of(context).viewInsets;
    final maxHeight = MediaQuery.of(context).size.height * 0.85;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        constraints: BoxConstraints(maxHeight: maxHeight),
        padding: EdgeInsets.all(24.w).copyWith(
          bottom: 24.w + viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New leave request',
                style: PlusJakartaSansFontPalette.base700(
                  18,
                  color: ColorPalette.f101828,
                ),
                textAlign: TextAlign.center,
              ),
              16.verticalSpace,
              Text(
                'Leave type',
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.f101828,
                ),
              ),
              6.verticalSpace,
              ValueListenableBuilder<LeaveTypeItem?>(
                valueListenable: _selectedLeaveType,
                builder: (context, selected, _) {
                  return ValueListenableBuilder<String?>(
                    valueListenable: _leaveTypeError,
                    builder: (context, leaveTypeError, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropdownButtonFormField<LeaveTypeItem>(
                            value: selected,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 12.h,
                              ),
                              errorText: leaveTypeError,
                            ),
                            hint: const Text('Select leave type'),
                            items: leaveTypes
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name ?? ''),
                                  ),
                                )
                                .toList(),
                            onChanged: (v) {
                              _selectedLeaveType.value = v;
                              _leaveTypeError.value = null;
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              12.verticalSpace,
              Text(
                'From date',
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.f101828,
                ),
              ),
              6.verticalSpace,
              ValueListenableBuilder<DateTime?>(
                valueListenable: _fromDate,
                builder: (context, fromDate, _) {
                  return ValueListenableBuilder<String?>(
                    valueListenable: _fromDateError,
                    builder: (context, fromDateError, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: _pickFromDate,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 12.h,
                                ),
                                errorText: fromDateError,
                              ),
                              child: Text(
                                fromDate != null
                                    ? _formatDate(fromDate)
                                    : 'Select from date',
                                style: PlusJakartaSansFontPalette.base600(
                                  14,
                                  color: fromDate != null
                                      ? ColorPalette.f101828
                                      : ColorPalette.f99A1AF,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              12.verticalSpace,
              Text(
                'To date',
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.f101828,
                ),
              ),
              6.verticalSpace,
              ValueListenableBuilder<DateTime?>(
                valueListenable: _toDate,
                builder: (context, toDate, _) {
                  return ValueListenableBuilder<String?>(
                    valueListenable: _toDateError,
                    builder: (context, toDateError, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: _pickToDate,
                            child: InputDecorator(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 12.h,
                                ),
                                errorText: toDateError,
                              ),
                              child: Text(
                                toDate != null
                                    ? _formatDate(toDate)
                                    : 'Select to date',
                                style: PlusJakartaSansFontPalette.base600(
                                  14,
                                  color: toDate != null
                                      ? ColorPalette.f101828
                                      : ColorPalette.f99A1AF,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ValueListenableBuilder<DateTime?>(
                valueListenable: _fromDate,
                builder: (context, fromDate, _) {
                  return ValueListenableBuilder<DateTime?>(
                    valueListenable: _toDate,
                    builder: (context, toDate, _) {
                      final days = _numberOfDays(fromDate, toDate);
                      if (days == null) return const SizedBox.shrink();
                      return Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          '$days day(s)',
                          style: PlusJakartaSansFontPalette.base600(
                            14,
                            color: ColorPalette.f6C7278,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              12.verticalSpace,
              Text(
                'Reason',
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.f101828,
                ),
              ),
              6.verticalSpace,
              ValueListenableBuilder<String?>(
                valueListenable: _reasonError,
                builder: (context, reasonError, _) {
                  return CommonTextFormField(
                    controller: _reasonController,
                    height: 150.h,
                    textAlignVertical: TextAlignVertical.top,
                    label: 'Reason',
                    errorText: reasonError,
                    hintText:
                        'e.g. Personal Leave (max $_maxReasonLength characters)',
                    maxLines: 8,

                    maxLength: _maxReasonLength,
                    onChanged: (_) => _reasonError.value = null,
                  );
                },
              ),
              24.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: createLoader
                          ? null
                          : () => Navigator.of(context).pop(context),
                      buttonText: 'Cancel',
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: PrimaryButton(
                      onPressed: createLoader
                          ? null
                          : () async {
                              if (!_validate()) return;
                              final leaveType = _selectedLeaveType.value!;
                              final from = _fromDate.value!;
                              final to = _toDate.value!;
                              final success = await notifier.submitLeaveRequest(
                                leaveType.id!,
                                leaveType.name!,
                                _formatDate(from),
                                _formatDate(to),
                                _reasonController.text.trim(),
                              );
                              if (context.mounted && success) {
                                Navigator.of(context).pop(context);
                              }
                            },
                      buttonText: 'Submit',
                      color: ColorPalette.primaryColor,
                      isLoading: createLoader,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
