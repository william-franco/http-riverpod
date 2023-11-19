// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/dependency_injector/dependency_injector.dart';
import 'package:http_riverpod/src/features/setting/views/setting_view.dart';
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
    final viewModel = ref.watch(bottomViewModelProvider);
    return Scaffold(
      body: listOfWidgets.elementAt(viewModel.indexTab),
      bottomNavigationBar: NavigationBar(
        selectedIndex: viewModel.indexTab,
        animationDuration: const Duration(milliseconds: 600),
        onDestinationSelected: (int index) {
          ref
              .read(bottomViewModelProvider.notifier)
              .changeIndexBottom(index: index);
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
