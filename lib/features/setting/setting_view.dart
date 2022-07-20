import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/setting/setting_singleton.dart';
import 'package:http_riverpod/widgets/atoms/text_atom.dart';
import 'package:http_riverpod/widgets/molecules/app_bar_molecule.dart';

class SettingView extends ConsumerWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(settingProvider);
    return Scaffold(
      appBar: AppBarMolecule(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const TextAtom(text: 'Configurações'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_6_outlined),
              title: const Text('Tema escuro'),
              trailing: Switch(
                value: themeData,
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
