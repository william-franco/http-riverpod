// Flutter imports:
import 'package:flutter/material.dart';

class LoadingAtom extends StatelessWidget {
  const LoadingAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
    );
  }
}
