import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/constants/string_constants.dart';
import '../../../res/styles/color_palette.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Strings.helloVanessa),
              SizedBox(height: 4.h),
              Text(Strings.welcomeToTripGlide),
            ],
          ),
          CircleAvatar(
            radius: 24.r,
            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/150?img=5',
            ),
            backgroundColor: ColorPalette.grey,
          ),
        ],
      ),
    );
  }
}
