// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/bottom/presentation/riverpod/bottom_provider.dart';
import 'package:http_riverpod/src/features/setting/presentation/views/setting_view.dart';
import 'package:http_riverpod/src/features/todos/presentation/views/todo_view.dart';
import 'package:http_riverpod/src/features/users/presentation/views/user_view.dart';

class BottomView extends ConsumerStatefulWidget {
  const BottomView({super.key});

  @override
  ConsumerState<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends ConsumerState<BottomView> {
  final tabs = [
    const UserView(),
    const TodoView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bottomProvider);
    return Scaffold(
      body: tabs[state],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state,
        onTap: (int index) {
          ref.read(bottomProvider.notifier).currentIndex(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
