import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart' as smooth_corner;

/// A container with smooth iOS-style rounded corners
/// Wraps the smooth_corner package's SmoothContainer
class SmoothContainer extends StatelessWidget {
  const SmoothContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.color,
    this.borderRadius,
    this.smoothness = 0.6,
    this.child,
    this.alignment,
    this.constraints,
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxDecoration? decoration;
  final Color? color;
  final BorderRadius? borderRadius;
  final double smoothness;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = decoration?.color ?? color ?? Colors.transparent;

    return smooth_corner.SmoothContainer(
      smoothness: smoothness,
      borderRadius: borderRadius ?? BorderRadius.zero,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      color: effectiveColor,
      alignment: alignment,
      constraints: constraints,
      child: child,
    );
  }
}
