// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/features/setting/presentation/riverpod/setting_provider.dart';
import 'package:http_riverpod/src/widgets/atoms/text_atom.dart';
import 'package:http_riverpod/src/widgets/molecules/app_bar_molecule.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingProvider);
    return Scaffold(
      appBar: const AppBarMolecule(
        title: TextAtom(text: 'Settings'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_6_outlined),
              title: const Text('Dark theme'),
              trailing: Switch(
                value: state,
                onChanged: (bool enabled) {
                  ref.read(settingProvider.notifier).changeTheme(enabled);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
