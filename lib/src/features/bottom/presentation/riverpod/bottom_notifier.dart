// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNotifier extends StateNotifier<int> {
  BottomNotifier() : super(0);

  void currentIndex(int index) {
    state = index;
    _debugProvider();
  }

  void _debugProvider() {
    log('Current tab: $state');
  }
}
