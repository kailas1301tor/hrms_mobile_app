import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/constants/string_constants.dart';
import '../notifier/home_notifier.dart';

class HomeUpcomingToursList extends ConsumerStatefulWidget {
  const HomeUpcomingToursList({super.key});

  @override
  ConsumerState<HomeUpcomingToursList> createState() =>
      _HomeUpcomingToursListState();
}

class _HomeUpcomingToursListState extends ConsumerState<HomeUpcomingToursList> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildHeader(), 16.verticalSpace, _buildUpcomingToursList()],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(Strings.upcomingTours), Text(Strings.seeAll)],
      ),
    );
  }

  Widget _buildUpcomingToursList() {
    final homeState = ref.watch(homeProvider);

    return AspectRatio(
      aspectRatio: 1.2,
      child: PageView.builder(
        controller: _pageController,
        itemCount: homeState.tours.length,
        padEnds: false,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0.0;
              if (_pageController.position.haveDimensions) {
                value = index - _pageController.page!;
              } else {
                value = (index - _currentPage).toDouble();
              }

              // Simple scale effect for focus
              final double scale = (1 - (value.abs() * 0.1)).clamp(0.9, 1.0);
              final double opacity = (1 - (value.abs() * 0.3)).clamp(0.5, 1.0);

              return Transform.scale(
                scale: scale,
                child: Opacity(opacity: opacity, child: child),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: _buildTourCard(
                homeState.tours[index].title,
                homeState.tours[index].subtitle,
                homeState.tours[index].image,
                homeState.tours[index].rating,
                homeState.tours[index].reviews,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTourCard(
    String title,
    String subtitle,
    String image,
    String rating,
    String reviews,
  ) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.7),
                ],
                stops: const [0.6, 1.0],
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title),
                        4.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 14.sp,
                            ),
                            4.horizontalSpace,
                            Text(subtitle),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: ShapeDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14.sp),
                          4.horizontalSpace,
                          Text(rating),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
