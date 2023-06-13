// Flutter imports:
import 'package:flutter/material.dart';

class CommonPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const CommonPadding({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(
        child: child,
      ),
    );
  }
}
