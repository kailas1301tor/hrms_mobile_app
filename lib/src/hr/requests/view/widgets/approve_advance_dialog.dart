import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/hr/requests/notifier/hr_requests_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/normal_text_form_field.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';

class ApproveAdvanceDialog extends ConsumerStatefulWidget {
  const ApproveAdvanceDialog({super.key, required this.requestId});

  final String requestId;

  @override
  ConsumerState<ApproveAdvanceDialog> createState() =>
      _ApproveAdvanceDialogState();
}

class _ApproveAdvanceDialogState extends ConsumerState<ApproveAdvanceDialog> {
  final _amountController = TextEditingController();
  final _amountError = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _amountController.dispose();
    _amountError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(hrRequestsProvider.notifier);
    final state = ref.watch(hrRequestsProvider);
    final actionLoader = state.actionLoader;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Approve salary advance',
              style: PlusJakartaSansFontPalette.base700(
                18,
                color: ColorPalette.f101828,
              ),
              textAlign: TextAlign.center,
            ),
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
                  hintText: 'e.g. 500',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  errorText: amountError,
                  onChanged: (_) => _amountError.value = null,
                );
              },
            ),
            24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onPressed: actionLoader
                        ? null
                        : () => Navigator.of(context).pop(context),
                    buttonText: 'Cancel',
                    color: ColorPalette.primaryColor,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: PrimaryButton(
                    onPressed: actionLoader
                        ? null
                        : () {
                            final text = _amountController.text.trim();
                            final amount = int.tryParse(text);
                            if (text.isEmpty || amount == null || amount <= 0) {
                              _amountError.value =
                                  'Please enter a valid amount';
                              return;
                            }
                            notifier.submitApproveAdvance(
                              context,
                              widget.requestId,
                              amount,
                            );
                          },
                    buttonText: 'Submit',
                    color: ColorPalette.primaryColor,
                    isLoading: actionLoader,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
