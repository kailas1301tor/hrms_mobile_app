import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/src/track/view/widgets/loan_card.dart';

class LoansSection extends StatelessWidget {
  const LoansSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: 1,
      itemBuilder: (context, index) {
        return const LoanCard();
      },
    );
  }
}
