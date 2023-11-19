// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/dependency_injector/dependency_injector.dart';

class ThemeListTileWidget extends ConsumerWidget {
  const ThemeListTileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingViewModelProvider);
    return ListTile(
      leading: const Icon(Icons.brightness_6_outlined),
      title: const Text('Dark theme'),
      trailing: Switch(
        value: viewModel.isDarkTheme,
        onChanged: (bool enabled) {
          ref
              .read(settingViewModelProvider.notifier)
              .changeTheme(isDarkTheme: enabled);
        },
      ),
    );
  }
}
