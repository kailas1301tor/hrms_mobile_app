import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/inter_font_palette.dart';


class FluidPrimaryButton extends StatelessWidget {
  const FluidPrimaryButton({
    super.key,
    this.onPressed,
    this.color,
    required this.buttonText,
    this.borderColor = Colors.transparent,
    this.height,
    this.width,
    this.textStyle,
    this.isLoading = false,
    this.expanded = true,
    this.padding,
  });

  final Function()? onPressed;
  final Color? color;
  final String buttonText;
  final Color borderColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final bool isLoading;
  final bool expanded;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // Pill shape (Stadium)
    final borderRadius = BorderRadius.circular(100.r);
    final buttonHeight = height ?? 56.h;

    // Determine the target width
    // If loading, width = height (circle)
    // If not loading, width = expanded ? infinity (but AnimatedContainer needs finite) : width
    // To handle infinity with AnimatedContainer, we can wrap in a LayoutBuilder or just use a large width if expanded.
    // However, AnimatedContainer cannot animate to double.infinity.
    // A better approach for "expanded" is to use an Alignment or Center in the parent, but here we want the button itself to animate.
    // If expanded is true, we should probably use LayoutBuilder to get the max width.

    return LayoutBuilder(
      builder: (context, constraints) {
        final double targetWidth = isLoading
            ? buttonHeight
            : (width ?? (expanded ? constraints.maxWidth : double.infinity));

        // If we still have infinity (e.g. unconstrained parent), we might have issues.
        // Assuming standard usage in a Column/Row/Stack where constraints are available.
        // If targetWidth is infinite, we can't animate.
        // Let's assume for now it's constrained.

        return Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            width: targetWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                  spreadRadius: -5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // 1. Ultra-transparent base (Glass tint)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),

                    // 2. Liquid Shine (Top Gloss)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: buttonHeight / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(100.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.white.withValues(alpha: 0.02),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // 3. Bottom Reflection
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: buttonHeight / 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(100.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.white.withValues(alpha: 0.1),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // 4. Rim Light
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                          width: 1,
                        ),
                      ),
                    ),

                    // 5. Content (Text or Loader)
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                      child: isLoading
                          ? SizedBox(
                              key: const ValueKey('loader'),
                              height: 24.h,
                              width: 24.w,
                              child: CupertinoActivityIndicator(
                                radius: 12.r,
                                color: ColorPalette.black,
                              ),
                            )
                          : Text(
                              buttonText,
                              key: const ValueKey('text'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  textStyle ??
                                  InterFontPalette.fWhite_18_600.copyWith(
                                    letterSpacing: 0.5,
                                    shadows: [
                                      Shadow(
                                        color: ColorPalette.black.withValues(
                                          alpha: 0.2,
                                        ),
                                        offset: const Offset(0, 1),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                            ),
                    ),

                    // 6. InkWell Overlay
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: isLoading ? null : onPressed,
                          borderRadius: borderRadius,
                          splashColor: Colors.white.withValues(alpha: 0.2),
                          highlightColor: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
