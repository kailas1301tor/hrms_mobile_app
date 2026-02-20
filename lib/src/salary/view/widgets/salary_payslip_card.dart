import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_mobile/src/salary/notifier/staff_salary_notifier.dart';
import 'package:intl/intl.dart';
import 'package:smooth_corner/smooth_corner.dart';
import '../../../../utils/routes/route_constants.dart';
import '../../../../res/styles/color_palette.dart';
import '../../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import '../../../home/model/staff_payslip_response.dart';

class SalaryPayslipCard extends ConsumerStatefulWidget {
  final StaffPayslipResponse payslip;

  const SalaryPayslipCard({super.key, required this.payslip});

  @override
  ConsumerState<SalaryPayslipCard> createState() => _SalaryPayslipCardState();
}

class _SalaryPayslipCardState extends ConsumerState<SalaryPayslipCard> {
  String _getMonthYear(StaffPayslipResponse payslip) {
    final date = DateTime(
      payslip.year ?? DateTime.now().year,
      payslip.month ?? 1,
    );
    return DateFormat('MMMM yyyy').format(date);
  }

  String _getAmountString(StaffPayslipResponse payslip) {
    final currencyFormatter = NumberFormat.currency(
      symbol: 'AED ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(payslip.netSalary ?? 0);
  }

  Future<void> _onDownload(BuildContext context) async {
    // Check if any download is in progress for this card to prevent double taps
    // We can use read here to get current state
    final isDownloading = ref.read(
      staffSalaryProvider.select(
        (state) => state.downloadingPayslipId == widget.payslip.id,
      ),
    );

    if (isDownloading) return;

    final monthYear = _getMonthYear(widget.payslip);
    final fileName = "$monthYear Payslip";

    final path = await ref
        .read(staffSalaryProvider.notifier)
        .downloadPayslip(widget.payslip.id ?? "", fileName);

    if (path != null && context.mounted) {
      Navigator.pushNamed(
        context,
        RouteConstants.routePayslipViewer,
        arguments: {'filePath': path, 'fileName': fileName},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch for changes specifically for this card's ID
    final isDownloading = ref.watch(
      staffSalaryProvider.select(
        (state) => state.downloadingPayslipId == widget.payslip.id,
      ),
    );

    final monthYear = _getMonthYear(widget.payslip);
    final amountString = _getAmountString(widget.payslip);

    return SmoothContainer(
      smoothness: 2,
      borderRadius: BorderRadius.circular(20.r),
      color: ColorPalette.white,
      side: BorderSide(
        color: const Color(0xFFEBEBEB), // Light grey border
        width: 1.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: InkWell(
        onTap: () => _onDownload(context),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: isDownloading
                  ? SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: ColorPalette.primaryColor,
                      ),
                    )
                  : SvgPicture.asset(
                      width: 24.w,
                      height: 24.w,
                      "assets/images/svg/download.svg",
                      colorFilter: ColorFilter.mode(
                        ColorPalette.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monthYear,
                    style: PlusJakartaSansFontPalette.f0E0F0C_14_600.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    widget.payslip.status ?? "",
                    style: PlusJakartaSansFontPalette.f0E0F0C_14_600.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: const Color(0xFF98A2B3),
                    ),
                  ),
                ],
              ),
            ),
            4.horizontalSpace,
            Text(
              amountString,
              style: PlusJakartaSansFontPalette.f009689_14_400.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: ColorPalette.primaryColor, // Dark color for amount
              ),
            ),
          ],
        ),
      ),
    );
  }
}
