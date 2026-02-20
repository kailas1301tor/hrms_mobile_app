import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/src/hr/requests/notifier/hr_requests_notifier.dart';
import 'package:hrms_mobile/utils/common_widgets/common_switch_state_no_expanded.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';

import 'approve_leave_dialog.dart';
import 'leave_request_card.dart';
import 'reject_request_dialog.dart';
import 'request_shimmer.dart';

class LeaveRequestsListView extends ConsumerWidget {
  const LeaveRequestsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(
      hrRequestsProvider.select((s) => s.leaveRequests),
    );
    final loaderState = ref.watch(
      hrRequestsProvider.select((s) => s.leaveLoaderState),
    );
    final loadingMore = ref.watch(
      hrRequestsProvider.select((s) => s.leaveLoadingMore),
    );
    final notifier = ref.read(hrRequestsProvider.notifier);
    final itemCount = list.length + (loadingMore ? 1 : 0);

    return CommonSwitchStateNoExpanded(
      topMargin: context.sh() * .1,
      loaderState: loaderState,
      loader: const RequestShimmer(),
      reload: notifier.fetchLeaveRequests,
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
          return LeaveRequestCard(
            request: item,
            onApprove: () {
              notifier.clearActionControllers();
              showDialog(
                context: context,
                builder: (ctx) => ApproveLeaveDialog(requestId: item.id ?? ''),
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
