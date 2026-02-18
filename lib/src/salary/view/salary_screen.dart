import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/res/constants/app_constants.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/salary/view/widgets/earnings_card.dart';

class SalaryScreen extends StatelessWidget {
  const SalaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 24.h),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final months = [
                      'April 2024',
                      'March 2024',
                      'February 2024',
                    ];
                    return EarningsCard(
                      monthYear: months[index],
                      amount: '${AppConstants.currency} 12,450',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
