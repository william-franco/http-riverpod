import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/bottom/bottom_provider.dart';

final bottomProvider = StateNotifierProvider<BottomProvider, int>((ref) {
  return BottomProvider();
});
