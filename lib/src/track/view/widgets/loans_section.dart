import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/src/track/notifier/track_notifier.dart';
import 'package:hrms_mobile/src/track/view/widgets/loan_card.dart';
import 'package:hrms_mobile/utils/common_widgets/common_switch_state_no_expanded.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';

class LoansSection extends ConsumerWidget {
  const LoansSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(trackProvider.select((s) => s.loanRequests));
    final loaderState =
        ref.watch(trackProvider.select((s) => s.loanLoaderState));
    final loadingMore =
        ref.watch(trackProvider.select((s) => s.loanLoadingMore));
    final notifier = ref.read(trackProvider.notifier);
    final itemCount = list.length + (loadingMore ? 1 : 0);

    return CommonSwitchStateNoExpanded(
      topMargin: context.sh() * .1,
      loaderState: loaderState,
      reload: notifier.fetchLoanRequests,
      child: RefreshIndicator(
        onRefresh: notifier.fetchLoanRequests,
        color: ColorPalette.primaryColor,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 24.h),
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
          return LoanCard(item: list[index]);
        },
        ),
      ),
    );
  }
}
