// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:http_riverpod/src/constants/constants.dart';
import 'package:http_riverpod/src/features/setting/models/setting_model.dart';
import 'package:http_riverpod/src/services/storage_service.dart';

abstract base class SettingViewModel extends StateNotifier<SettingModel> {
  SettingViewModel() : super(SettingModel());

  Future<void> loadTheme();
  Future<void> changeTheme({required bool isDarkTheme});
}

base class SettingViewModelImpl extends StateNotifier<SettingModel>
    implements SettingViewModel {
  final StorageService storageService;

  SettingViewModelImpl({
    required this.storageService,
  }) : super(SettingModel()) {
    loadTheme();
  }

  @override
  Future<void> loadTheme() async {
    state.isDarkTheme =
        await storageService.getBoolValue(key: Constants.darkMode);
    _debug();
  }

  @override
  Future<void> changeTheme({required bool isDarkTheme}) async {
    state.isDarkTheme = isDarkTheme;
    await storageService.setBoolValue(
      key: Constants.darkMode,
      value: isDarkTheme,
    );
    _debug();
  }

  void _debug() {
    log('Dark theme: ${state.isDarkTheme}');
  }
}
