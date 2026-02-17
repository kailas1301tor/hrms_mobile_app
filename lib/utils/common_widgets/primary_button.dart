import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/styles/color_palette.dart';
import '../../res/styles/fonts/inter_font_palette.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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

    final buttonContent = Container(
      width: expanded ? double.infinity : width,
      height: height ?? 56.h,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: [
          // Deep, soft shadow to lift it off the background
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
            children: [
              // 1. Ultra-transparent base (Glass tint)
              Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: Colors.white.withValues(
                    alpha: 0.2,
                  ), // Much more transparent
                ),
              ),

              // 2. Liquid Shine (Top Gloss)
              // Simulates light hitting the top curve of the liquid
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: height != null ? height! / 2 : 28.h,
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

              // 3. Bottom Reflection (Subtle bounce light)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: height != null ? height! / 3 : 20.h,
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

              // 4. Rim Light / Border
              Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                    width: 1,
                  ),
                ),
              ),

              // 5. Content
              Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
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
              ),

              // 6. InkWell Overlay for Splash
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
    );

    if (!expanded && width == null) {
      return IntrinsicWidth(child: buttonContent);
    }

    return buttonContent;
  }
}
