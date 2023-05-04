// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/views/bottom_view.dart';
import 'package:http_riverpod/src/features/setting/presentation/views/setting_view.dart';
import 'package:http_riverpod/src/features/todos/presentation/views/todo_view.dart';
import 'package:http_riverpod/src/features/users/presentation/views/user_view.dart';

void main() {
  group('BottomView', () {
    testWidgets('BottomView should change tabs', (WidgetTester tester) async {
      const widget = MaterialApp(
        home: ProviderScope(
          child: BottomView(),
        ),
      );

      final userView = find.byType(UserView);
      final todoView = find.byType(TodoView);
      final settingView = find.byType(SettingView);
      final listIcon = (find.byIcon(Icons.list_outlined));
      final settingsIcon = (find.byIcon(Icons.settings_outlined));

      await tester.pumpWidget(widget);

      expect(userView, findsOneWidget);
      expect(todoView, findsNothing);
      expect(settingView, findsNothing);

      await tester.tap(listIcon);
      await tester.pumpAndSettle();

      expect(userView, findsNothing);
      expect(todoView, findsOneWidget);
      expect(settingView, findsNothing);

      await tester.tap(settingsIcon);
      await tester.pumpAndSettle();

      expect(userView, findsNothing);
      expect(todoView, findsNothing);
      expect(settingView, findsOneWidget);
    });
  });
}
