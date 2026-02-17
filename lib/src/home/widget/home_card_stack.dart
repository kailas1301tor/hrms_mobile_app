import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/styles/color_palette.dart';
import '../notifier/home_notifier.dart';
import 'trip_card.dart';

class HomeCardStack extends ConsumerStatefulWidget {
  const HomeCardStack({super.key});

  @override
  ConsumerState<HomeCardStack> createState() => _HomeCardStackState();
}

class _HomeCardStackState extends ConsumerState<HomeCardStack> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);


    return SizedBox(
      height: 380.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: homeState.trips.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
              } else {
                // Initial state
                value = index == _currentPage ? 1.0 : 0.8;
              }

              final double scale = Curves.easeOut.transform(value);
              final double opacity =
                  (scale - 0.5) / 0.5; // Fade out non-focused items

              return Transform.scale(
                scale: scale,
                child: Opacity(opacity: opacity.clamp(0.0, 1.0), child: child),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: TripCard(
                imageUrl: homeState.trips[index].imageUrl,
                title: homeState.trips[index].title,
                location: homeState.trips[index].location,
                rating: homeState.trips[index].rating,
                reviews: homeState.trips[index].reviews,
              ),
            ),
          );
        },
      ),
    );
  }
}
