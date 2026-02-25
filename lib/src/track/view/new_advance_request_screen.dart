import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/track/notifier/track_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/normal_text_form_field.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';

class NewAdvanceRequestScreen extends ConsumerStatefulWidget {
  const NewAdvanceRequestScreen({super.key});

  @override
  ConsumerState<NewAdvanceRequestScreen> createState() =>
      _NewAdvanceRequestScreenState();
}

class _NewAdvanceRequestScreenState
    extends ConsumerState<NewAdvanceRequestScreen> {
  static const int _maxAmountDigits = 6;
  static const int _maxAmount = 999999;
  static const int _maxReasonLength = 300;

  final _amountController = TextEditingController();
  final _reasonController = TextEditingController();
  final _amountError = ValueNotifier<String?>(null);
  final _reasonError = ValueNotifier<String?>(null);

  void _clearErrors() {
    _amountError.value = null;
    _reasonError.value = null;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _reasonController.dispose();
    _amountError.dispose();
    _reasonError.dispose();
    super.dispose();
  }

  bool _validate() {
    _clearErrors();
    var valid = true;
    final amount = int.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0) {
      _amountError.value = 'Please enter a valid amount';
      valid = false;
    } else if (amount > _maxAmount) {
      _amountError.value = 'Amount must be at most $_maxAmount (6 digits)';
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
    final createLoader = state.createRequestLoader;

    return Scaffold(
      backgroundColor: const Color(0XFFF8F9FB),
      appBar: AppBar(
        title: Text(
          'New Salary Advance',
          style: PlusJakartaSansFontPalette.base700(
            18.sp,
            color: ColorPalette.f101828,
          ),
        ),
        backgroundColor: ColorPalette.white,
        elevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: ColorPalette.f101828),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: ColorPalette.fE5E7EB.withValues(alpha: 0.5),
            height: 1.h,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              16.verticalSpace,
              Text(
                'Amount',
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.f101828,
                ),
              ),
              6.verticalSpace,
              ValueListenableBuilder<String?>(
                valueListenable: _amountError,
                builder: (context, amountError, _) {
                  return CommonTextFormField(
                    controller: _amountController,
                    label: 'Amount',
                    errorText: amountError,
                    hintText: 'e.g. 500 (max 6 digits)',
                    keyboardType: TextInputType.number,
                    maxLength: _maxAmountDigits,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(_maxAmountDigits),
                    ],
                    onChanged: (_) => _amountError.value = null,
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
                    height: 150.h,
                    controller: _reasonController,
                    label: 'Reason',
                    errorText: reasonError,
                    hintText:
                        'e.g. Urgent Bill (max $_maxReasonLength characters)',
                    maxLines: 8,
                    textAlignVertical: TextAlignVertical.top,
                    maxLength: _maxReasonLength,
                    scrollPadding: EdgeInsets.only(bottom: 120.h),
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
                              final amount =
                                  int.tryParse(_amountController.text.trim()) ??
                                  0;
                              final success = await notifier
                                  .submitAdvanceRequest(
                                    amount,
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
