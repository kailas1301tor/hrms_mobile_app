import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Wraps [child] with [AnnotatedRegion] to apply a [SystemUiOverlayStyle].
/// Use for screens that need a specific status bar / system UI look.
///
/// Example:
/// ```dart
/// SystemUiStyleWrapper(
///   style: AppTheme.systemOverlayStyleDark, // light icons on dark background
///   child: Scaffold(...),
/// )
/// ```
class SystemUiStyleWrapper extends StatelessWidget {
  const SystemUiStyleWrapper({
    super.key,
    required this.style,
    required this.child,
  });

  final SystemUiOverlayStyle style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: child,
    );
  }
}
