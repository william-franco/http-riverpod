// Flutter imports:
import 'package:flutter/material.dart';

class TextFailedAtom extends StatelessWidget {
  final String error;

  const TextFailedAtom({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error $error',
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
