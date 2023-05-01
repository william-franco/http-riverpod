// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNotifier extends StateNotifier<int> {
  BottomNotifier() : super(0);

  void changeIndexBottom(int index) {
    state = index;
    _debug();
  }

  void _debug() {
    log('Current tab: $state');
  }
}
