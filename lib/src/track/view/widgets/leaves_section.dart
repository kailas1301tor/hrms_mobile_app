import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/src/track/view/widgets/leave_card.dart';

class LeavesSection extends StatelessWidget {
  const LeavesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 24.h),
      itemCount: 3,
      itemBuilder: (context, index) {
        return const LeaveCard();
      },
    );
  }
}
