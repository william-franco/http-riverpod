// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends StateNotifier<bool> {
  SettingProvider(this.prefs) : super(prefs?.getBool('theme') ?? false);

  final SharedPreferences? prefs;

  void changeTheme(bool value) {
    state = value;
    prefs!.setBool('theme', state);
    _debugProvider();
  }

  void _debugProvider() {
    log('Dark theme: $state');
  }
}
