import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension Context on BuildContext {
  double sh({double size = 1.0}) {
    return MediaQuery.of(this).size.height * size;
  }

  double sw({double size = 1.0}) {
    return MediaQuery.of(this).size.width * size;
  }

  int cacheSize(double size) {
    return (size * MediaQuery.of(this).devicePixelRatio).round();
  }
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    } else {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
  }
}

extension OpacityColorExtension on Color {
  Color mimicOpacityColor(double opacity) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0.0 and 1.0',
    );
    return withOpacity(opacity);
  }
}

extension WidgetExtension on Widget {
  Widget animatedSwitch({
    Curve? curvesIn,
    Curve? curvesOut,
    int duration = 200,
    int reverseDuration = 200,
    Widget Function(Widget, Animation<double>) transitionBuilder =
        AnimatedSwitcher.defaultTransitionBuilder,
  }) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      reverseDuration: Duration(milliseconds: reverseDuration),
      switchInCurve: curvesIn ?? Curves.linear,
      switchOutCurve: curvesOut ?? Curves.linear,
      transitionBuilder: transitionBuilder,
      child: this,
    );
  }

  Widget showGradientShimmer({double? borderRadius}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: const Duration(milliseconds: 1200),
      child: ClipRRect(
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: this,
      ),
    );
  }

  static Widget crossSwitch({
    required Widget first,
    Widget second = const SizedBox.shrink(),
    required bool value,
    Curve curvesIn = Curves.linear,
    Curve curvesOut = Curves.linear,
    Duration? duration,
  }) {
    return AnimatedCrossFade(
      firstChild: first,
      secondChild: second,
      crossFadeState: value
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: duration ?? const Duration(milliseconds: 300),
      firstCurve: curvesIn,
      secondCurve: curvesOut,
    );
  }

  Widget convertToSliver() {
    return SliverToBoxAdapter(child: this);
  }
}

extension DateTimeExtension on DateTime? {
  String toFormattedDate() {
    if (this == null) return '';
    final date = this!;
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString().substring(2); // Get last two digits
    return '$day/$month/$year';
  }
}

extension StringToNumber on String {
  /// Converts the string to int if possible, otherwise to double.
  /// Returns null if the string is not a valid number.
  num? toSmartNumber() {
    final parsed = double.tryParse(this);
    if (parsed == null) return null;
    if (parsed % 1 == 0) {
      return parsed.toInt();
    }
    return parsed;
  }
}
