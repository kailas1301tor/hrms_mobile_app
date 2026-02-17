import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/src/track/view/widgets/advance_card.dart';

class AdvancesSection extends StatelessWidget {
  const AdvancesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const AdvanceCard();
      },
    );
  }
}
