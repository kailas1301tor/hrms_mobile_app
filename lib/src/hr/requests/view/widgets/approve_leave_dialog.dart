import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/hr/requests/notifier/hr_requests_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/primary_button.dart';

class ApproveLeaveDialog extends ConsumerWidget {
  const ApproveLeaveDialog({super.key, required this.requestId});

  final String requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(hrRequestsProvider.notifier);
    final actionLoader = ref.watch(
      hrRequestsProvider.select((s) => s.actionLoader),
    );

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
          children: [
            Text(
              'Approve leave request?',
              style: PlusJakartaSansFontPalette.base700(
                18,
                color: ColorPalette.f101828,
              ),
              textAlign: TextAlign.center,
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
                        : () => notifier.submitApproveLeave(context, requestId),
                    buttonText: 'Approve',
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
