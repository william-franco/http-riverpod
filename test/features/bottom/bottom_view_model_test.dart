// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/view_models/bottom_view_model.dart';

void main() {
  group('BottomViewModel', () {
    late BottomViewModel notifier;

    setUp(() {
      notifier = BottomViewModel();
    });

    test('initial value is 0', () {
      expect(notifier.state, 0);
    });

    test('change index', () {
      notifier.changeIndexBottom(index: 1);
      expect(notifier.state, 1);
    });
  });
}
