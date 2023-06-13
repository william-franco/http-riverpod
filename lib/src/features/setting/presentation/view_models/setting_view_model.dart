// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/constants/constants.dart';
import 'package:http_riverpod/src/services/storage_service.dart';

class SettingViewModel extends StateNotifier<bool> {
  final StorageService storageService;

  SettingViewModel({
    required this.storageService,
  }) : super(false) {
    loadTheme();
  }

  Future<void> loadTheme() async {
    state = await storageService.getBoolValue(key: Constants.darkMode);
    _debug();
  }

  Future<void> changeTheme({required bool isDarkTheme}) async {
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
