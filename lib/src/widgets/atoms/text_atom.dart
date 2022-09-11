// Flutter imports:
import 'package:flutter/material.dart';

class TextAtom extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextAtom({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
