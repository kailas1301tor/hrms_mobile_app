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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Earnings Statement',
                      style: PlusJakartaSansFontPalette.f0E0F0C_32_700,
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(child: _buildMonthDropdown()),
                        12.horizontalSpace,
                        Expanded(child: _buildYearDropdown()),
                      ],
                    ),
                  ],
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
                  noData: Center(
                    child: Text(
                      'No payslips found',
                      style: PlusJakartaSansFontPalette.base600(
                        14,
                        color: ColorPalette.f0E0F0C,
                      ),
                    ),
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async => ref
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

  Widget _buildMonthDropdown() {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: ref.watch(staffSalaryProvider.select((s) => s.selectedMonth)),
          hint: Text(
            'Month',
            style: PlusJakartaSansFontPalette.base600(
              14,
              color: const Color(0xFF64748B),
            ),
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
          items: [
            DropdownMenuItem<int>(
              value: null,
              child: Text(
                'All Months',
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.f0E0F0C,
                ),
              ),
            ),
            ...List.generate(12, (index) {
              return DropdownMenuItem<int>(
                value: index + 1,
                child: Text(
                  months[index],
                  style: PlusJakartaSansFontPalette.base600(
                    14,
                    color: ColorPalette.f0E0F0C,
                  ),
                ),
              );
            }),
          ],
          onChanged: (value) {
            ref.read(staffSalaryProvider.notifier).updateMonthFilter(value);
          },
        ),
      ),
    );
  }

  Widget _buildYearDropdown() {
    final currentYear = DateTime.now().year;
    final years = List.generate(
      5,
      (index) => currentYear - index,
    ); // Last 5 years

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: ref.watch(staffSalaryProvider.select((s) => s.selectedYear)),
          hint: Text(
            'Year',
            style: PlusJakartaSansFontPalette.base600(
              14,
              color: const Color(0xFF64748B),
            ),
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
          items: [
            DropdownMenuItem<int>(
              value: null,
              child: Text(
                'All Years',
                style: PlusJakartaSansFontPalette.base600(
                  14,
                  color: ColorPalette.f0E0F0C,
                ),
              ),
            ),
            ...years.map((year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(
                  year.toString(),
                  style: PlusJakartaSansFontPalette.base600(
                    14,
                    color: ColorPalette.f0E0F0C,
                  ),
                ),
              );
            }),
          ],
          onChanged: (value) {
            ref.read(staffSalaryProvider.notifier).updateYearFilter(value);
          },
        ),
      ),
    );
  }
}
