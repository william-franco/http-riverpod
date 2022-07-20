import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/bottom/bottom_singleton.dart';
import 'package:http_riverpod/features/setting/setting_view.dart';
import 'package:http_riverpod/features/todos/todo_view.dart';
import 'package:http_riverpod/features/users/user_view.dart';

class BottomView extends ConsumerStatefulWidget {
  const BottomView({Key? key}) : super(key: key);

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
    final tabData = ref.watch(bottomProvider);
    return Scaffold(
      body: tabs[tabData],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabData,
        onTap: (int index) {
          ref.read(bottomProvider.notifier).currentIndex(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Pessoas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Notas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
