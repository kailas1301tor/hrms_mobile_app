import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/styles/color_palette.dart';
import '../../../utils/common_widgets/adaptive_refresh_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.fF5F6F7,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            AdaptiveRefreshIndicator(
              onRefresh: () async {
                log("Home screen is refreshed");
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Home")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
