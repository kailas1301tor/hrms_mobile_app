import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;

  const HomeSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24.w));
  }
}
