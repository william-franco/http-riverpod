// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/constants/constants.dart';
import 'package:http_riverpod/src/services/storage_service.dart';

class SettingNotifier extends StateNotifier<bool> {
  final StorageService storageService;

  SettingNotifier({required this.storageService}) : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    state = await storageService.getBoolValue(key: Constants.darkMode);
    _debug();
  }

  Future<void> changeTheme(bool isDarkTheme) async {
    state = isDarkTheme;
    await storageService.setBoolValue(
      key: Constants.darkMode,
      value: isDarkTheme,
    );
    _debug();
  }

  void _debug() {
    log('Dark theme: $state');
  }
}
