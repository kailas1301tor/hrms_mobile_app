import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/salary/view/widgets/salary_payslip_card.dart';
import 'package:hrms_mobile/src/home/view/widgets/shimmer/pulse_recent_payslip_card_shimmer.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import '../../../../utils/common_widgets/common_switch_state.dart';
import '../notifier/staff_salary_notifier.dart';

class StaffSalaryScreen extends ConsumerStatefulWidget {
  const StaffSalaryScreen({super.key});

  @override
  ConsumerState<StaffSalaryScreen> createState() => _StaffSalaryScreenState();
}

class _StaffSalaryScreenState extends ConsumerState<StaffSalaryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(staffSalaryProvider.notifier).fetchSalaryHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final staffSalaryState = ref.watch(staffSalaryProvider);

    return Scaffold(
      backgroundColor: const Color(0XFFF8F9FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Text(
                  'Earnings Statement',
                  style: PlusJakartaSansFontPalette.f0E0F0C_32_700,
                ),
              ),
              Expanded(
                child: CommonSwitchState(
                  loaderState: staffSalaryState.loaderState,
                  errorMessage: staffSalaryState.error,
                  reload: () => ref
                      .read(staffSalaryProvider.notifier)
                      .fetchSalaryHistory(isRefresh: true),
                  loader: ListView.separated(
                    padding: EdgeInsets.only(bottom: 24.h),
                    itemCount: 5,
                    separatorBuilder: (context, index) => 12.verticalSpace,
                    itemBuilder: (context, index) =>
                        const PulseRecentPayslipCardShimmer(),
                  ),
                  child: RefreshIndicator(
                    onRefresh: () => ref
                        .read(staffSalaryProvider.notifier)
                        .fetchSalaryHistory(isRefresh: true),
                    color: ColorPalette.primaryColor,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 24.h),
                      itemCount: staffSalaryState.payslips?.length ?? 0,
                      separatorBuilder: (context, index) => 12.verticalSpace,
                      itemBuilder: (context, index) {
                        final payslip = staffSalaryState.payslips![index];
                        return SalaryPayslipCard(payslip: payslip);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
