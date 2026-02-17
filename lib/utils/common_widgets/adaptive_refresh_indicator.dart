import 'package:flutter/material.dart';

/// A refresh indicator that always uses CupertinoSliverRefreshControl
/// for a consistent iOS-style experience across all platforms
class AdaptiveRefreshIndicator extends StatelessWidget {
  const AdaptiveRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.color,
    this.backgroundColor,
  });

  final Future<void> Function() onRefresh;
  final Widget child;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    // Always use CupertinoSliverRefreshControl for iOS-style refresh
    return RefreshIndicator.adaptive(
      color: color,
      backgroundColor: backgroundColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
