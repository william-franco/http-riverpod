// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/riverpod/bottom_notifier.dart';

void main() {
  group('BottomViewModel', () {
    late BottomNotifier notifier;

    setUp(() {
      notifier = BottomNotifier();
    });

    test('initial value is 0', () {
      expect(notifier.state, 0);
    });

    test('change index', () {
      notifier.changeIndexBottom(1);
      expect(notifier.state, 1);
    });
  });
}
