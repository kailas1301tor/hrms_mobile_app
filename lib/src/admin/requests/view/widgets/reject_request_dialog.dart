import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/admin/requests/notifier/admin_requests_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/normal_text_form_field.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';

class RejectRequestDialog extends ConsumerStatefulWidget {
  const RejectRequestDialog({super.key, required this.requestId});

  final String requestId;

  @override
  ConsumerState<RejectRequestDialog> createState() =>
      _RejectRequestDialogState();
}

class _RejectRequestDialogState extends ConsumerState<RejectRequestDialog> {
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
    final rejectionReasonError = state.rejectionReasonError;

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
              'Reject request',
              style: PlusJakartaSansFontPalette.base700(
                18,
                color: ColorPalette.f101828,
              ),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            Text(
              'Rejection reason',
              style: PlusJakartaSansFontPalette.base600(
                14,
                color: ColorPalette.f101828,
              ),
            ),
            6.verticalSpace,
            CommonTextFormField(
              controller: notifier.rejectionReasonController,
              label: 'Reason',
              hintText: 'e.g. Policy violation or insufficient documentation',
              maxLines: 3,
              errorText: rejectionReasonError,
              onChanged: (_) => notifier.clearRejectionReasonError(),
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
                        : () =>
                              notifier.submitReject(context, widget.requestId),
                    buttonText: 'Reject',
                    color: ColorPalette.fFF2727,
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
