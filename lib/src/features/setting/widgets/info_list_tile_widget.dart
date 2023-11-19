// Flutter imports:
import 'package:flutter/material.dart';

class InfoListTileWidget extends StatefulWidget {
  const InfoListTileWidget({super.key});

  @override
  State<InfoListTileWidget> createState() => _InfoListTileWidgetState();
}

class _InfoListTileWidgetState extends State<InfoListTileWidget> {
  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationIcon: const FlutterLogo(),
      applicationName: 'Http Riverpod',
      applicationVersion: 'Version 1.0.0',
      applicationLegalese: '\u{a9} 2023 William Franco',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: const Text('About'),
      onTap: () {
        _showAboutDialog();
      },
    );
  }
}
