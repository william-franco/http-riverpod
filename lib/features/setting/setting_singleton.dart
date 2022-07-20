import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/features/setting/setting_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final settingProvider = StateNotifierProvider<SettingProvider, bool>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return SettingProvider(pref);
});
