// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/src/dependency_injector/dependency_injector.dart';

// Project imports:
import 'package:http_riverpod/src/features/setting/presentation/views/setting_view.dart';
import 'package:http_riverpod/src/features/todos/presentation/views/todo_view.dart';
import 'package:http_riverpod/src/features/users/presentation/views/user_view.dart';

class BottomView extends ConsumerStatefulWidget {
  const BottomView({super.key});

  @override
  ConsumerState<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends ConsumerState<BottomView> {
  final listOfWidgets = [
    const UserView(),
    const TodoView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bottomNotifierProvider);
    return Scaffold(
      body: listOfWidgets.elementAt(state),
      bottomNavigationBar: NavigationBar(
        selectedIndex: state,
        animationDuration: const Duration(milliseconds: 600),
        onDestinationSelected: (int index) {
          ref.read(bottomNotifierProvider.notifier).changeIndexBottom(index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Users',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            label: 'Todos',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
