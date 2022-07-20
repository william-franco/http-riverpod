// Flutter imports:
import 'package:flutter/material.dart';

class TextAtom extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextAtom({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
