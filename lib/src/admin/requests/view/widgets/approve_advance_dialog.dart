import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/admin/requests/notifier/admin_requests_notifier.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminRequestsProvider.notifier).clearActionControllers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(adminRequestsProvider.notifier);
    final state = ref.watch(adminRequestsProvider);
    final actionLoader = state.actionLoader;
    final interestRateError = state.interestRateError;
    final repaymentPeriodError = state.repaymentPeriodError;

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
              'Interest rate (%)',
              style: PlusJakartaSansFontPalette.base600(
                14,
                color: ColorPalette.f101828,
              ),
            ),
            6.verticalSpace,
            CommonTextFormField(
              controller: notifier.interestRateController,
              label: 'Interest rate',
              hintText: 'e.g. 0 for no interest',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              errorText: interestRateError,
              onChanged: (_) => notifier.clearInterestRateError(),
            ),
            12.verticalSpace,
            Text(
              'Repayment period (months)',
              style: PlusJakartaSansFontPalette.base600(
                14,
                color: ColorPalette.f101828,
              ),
            ),
            6.verticalSpace,
            CommonTextFormField(
              controller: notifier.repaymentPeriodController,
              label: 'Repayment period',
              hintText: 'e.g. 6 months',
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              errorText: repaymentPeriodError,
              onChanged: (_) => notifier.clearRepaymentPeriodError(),
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
                        : () => notifier.submitApproveAdvance(
                            context,
                            widget.requestId,
                          ),
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
