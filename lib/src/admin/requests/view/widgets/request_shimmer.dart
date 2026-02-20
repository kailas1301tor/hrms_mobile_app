import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';

import 'admin_request_card_common.dart';

class RequestShimmer extends StatelessWidget {
  const RequestShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AdminRequestCardBase(
            onApprove: () {},
            onReject: () {},
            name: '',
            requestId: '',
            dateStr: '',
            reason: '',
            status: '',
            typeLabel: '',
            middleSection: null,
          ).showGradientShimmer();
        },
      ),
    );
  }
}
