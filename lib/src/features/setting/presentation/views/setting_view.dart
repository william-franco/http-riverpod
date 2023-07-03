// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:http_riverpod/src/common_widgets/common_padding.dart';
import 'package:http_riverpod/src/features/setting/presentation/widgets/info_list_tile_widget.dart';
import 'package:http_riverpod/src/features/setting/presentation/widgets/theme_list_tile_widget.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
      ),
      body: CommonPadding(
        child: ListView(
          children: const <Widget>[
            ThemeListTileWidget(),
            InfoListTileWidget(),
          ],
        ),
      ),
    );
  }
}
