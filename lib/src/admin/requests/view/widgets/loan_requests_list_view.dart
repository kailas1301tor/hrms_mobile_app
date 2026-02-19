import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/src/admin/requests/notifier/admin_requests_notifier.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';

import '../../../../../utils/common_widgets/common_switch_state_no_expanded.dart';
import 'approve_loan_dialog.dart';
import 'loan_request_card.dart';
import 'reject_request_dialog.dart';

class LoanRequestsListView extends ConsumerWidget {
  const LoanRequestsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(adminRequestsProvider.select((s) => s.loanRequests));
    final loaderState = ref.watch(
      adminRequestsProvider.select((s) => s.loanLoaderState),
    );
    final loadingMore = ref.watch(
      adminRequestsProvider.select((s) => s.loanLoadingMore),
    );
    final notifier = ref.read(adminRequestsProvider.notifier);
    final itemCount = list.length + (loadingMore ? 1 : 0);

    return CommonSwitchStateNoExpanded(
      topMargin: context.sh() * .1,
      loaderState: loaderState,
      reload: notifier.fetchLoanRequests,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom: 20.h),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index >= list.length) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Center(
                child: CupertinoActivityIndicator(
                  color: ColorPalette.primaryColor,
                  radius: 14.r,
                ),
              ),
            );
          }
          final item = list[index];
          return LoanRequestCard(
            request: item,
            onApprove: () {
              notifier.clearActionControllers();
              showDialog(
                context: context,
                builder: (ctx) => ApproveLoanDialog(requestId: item.id ?? ''),
              );
            },
            onReject: () {
              notifier.clearActionControllers();
              showDialog(
                context: context,
                builder: (ctx) => RejectRequestDialog(requestId: item.id ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
