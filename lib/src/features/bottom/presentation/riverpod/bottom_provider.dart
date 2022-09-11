// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/riverpod/bottom_notifier.dart';

final bottomProvider = StateNotifierProvider<BottomNotifier, int>((ref) {
  return BottomNotifier();
});
