import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/common_widgets/primary_button.dart';

class TripCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String rating;
  final String reviews;

  const TripCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.6),
                ],
                stops: const [0.5, 1.0],
              ),
            ),
          ),
          // Favorite Button
          Positioned(
            top: 20.h,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: const CircleBorder(),
              ),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                8.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 16.sp),
                    4.horizontalSpace,
                    Text(location),
                  ],
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: ShapeDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16.sp,
                                ),
                                4.horizontalSpace,
                                Text(rating),
                              ],
                            ),
                          ),
                          12.horizontalSpace,
                          Flexible(
                            child: Text(
                              reviews,

                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.horizontalSpace,
                    SizedBox(
                      width: 110.w,
                      height: 48.h,
                      child: PrimaryButton(
                        onPressed: () {},
                        buttonText: "See More",
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
