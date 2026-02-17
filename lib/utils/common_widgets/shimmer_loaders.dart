import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrms_mobile/utils/helpers/extensions.dart';
import 'package:shimmer/shimmer.dart';

import '../../res/styles/color_palette.dart';

/// Generic shimmer loader for list items
class ListItemShimmer extends StatelessWidget {
  final double? height;
  final EdgeInsets? padding;

  const ListItemShimmer({
    super.key,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(16.w),
      child: Row(
        children: [
          // Avatar shimmer
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              shape: BoxShape.circle,
            ),
          ).showGradientShimmer(borderRadius: 50.r),
          SizedBox(width: 16.w),
          // Content shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ).showGradientShimmer(),
                SizedBox(height: 8.h),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ).showGradientShimmer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shimmer loader for card items
class CardItemShimmer extends StatelessWidget {
  final double? height;
  final EdgeInsets? margin;

  const CardItemShimmer({
    super.key,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      height: height ?? 120.h,
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorPalette.grey.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          // Icon shimmer
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: ColorPalette.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ).showGradientShimmer(borderRadius: 12.r),
          SizedBox(width: 16.w),
          // Content shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ).showGradientShimmer(),
                SizedBox(height: 8.h),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ).showGradientShimmer(),
                SizedBox(height: 4.h),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ).showGradientShimmer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shimmer loader for grid items
class GridItemShimmer extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const GridItemShimmer({
    super.key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
      ),
      itemCount: 6,
      padding: EdgeInsets.all(16.w),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: ColorPalette.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: ColorPalette.grey.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  shape: BoxShape.circle,
                ),
              ).showGradientShimmer(borderRadius: 50.r),
              SizedBox(height: 12.h),
              Container(
                width: 80.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ).showGradientShimmer(),
              SizedBox(height: 4.h),
              Container(
                width: 60.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: ColorPalette.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ).showGradientShimmer(),
            ],
          ),
        );
      },
    );
  }
}

/// Shimmer loader for list view
class ListViewShimmer extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int)? itemBuilder;
  final EdgeInsets? padding;

  const ListViewShimmer({
    super.key,
    this.itemCount = 5,
    this.itemBuilder,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding ?? EdgeInsets.all(16.w),
      itemCount: itemCount,
      itemBuilder: itemBuilder ??
          (context, index) {
            return ListItemShimmer();
          },
    );
  }
}

/// Shimmer loader for card list
class CardListShimmer extends StatelessWidget {
  final int itemCount;
  final EdgeInsets? padding;

  const CardListShimmer({
    super.key,
    this.itemCount = 5,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding ?? EdgeInsets.all(16.w),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return CardItemShimmer();
      },
    );
  }
}

/// Shimmer loader for detail screen
class DetailScreenShimmer extends StatelessWidget {
  const DetailScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header shimmer
          Center(
            child: Column(
              children: [
                Container(
                  width: 120.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    shape: BoxShape.circle,
                  ),
                ).showGradientShimmer(borderRadius: 50.r),
                SizedBox(height: 16.h),
                Container(
                  width: 200.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ).showGradientShimmer(),
                SizedBox(height: 8.h),
                Container(
                  width: 150.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ).showGradientShimmer(),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          // Content shimmer
          ...List.generate(5, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: ColorPalette.white,
                      shape: BoxShape.circle,
                    ),
                  ).showGradientShimmer(borderRadius: 50.r),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: ColorPalette.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ).showGradientShimmer(),
                        SizedBox(height: 4.h),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: ColorPalette.white,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ).showGradientShimmer(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// Generic shimmer container
class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      period: const Duration(milliseconds: 1200),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.zero,
        ),
      ),
    );
  }
}

