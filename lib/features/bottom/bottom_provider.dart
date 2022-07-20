import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomProvider extends StateNotifier<int> {
  BottomProvider() : super(0);

  void currentIndex(int index) {
    state = index;
    _debugProvider();
  }

  void _debugProvider() {
    log('Current tab: $state');
  }
}
