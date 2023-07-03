// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class StorageService {
  Future<bool> getBoolValue({required String key});
  Future<void> setBoolValue({required String key, required bool value});
}

class StorageServiceImpl implements StorageService {
  Future<SharedPreferences> _loadStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<bool> getBoolValue({required String key}) async {
    try {
      final storage = await _loadStorage();
      bool value = storage.getBool(key) ?? false;
      return value;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> setBoolValue({required String key, required bool value}) async {
    try {
      final storage = await _loadStorage();
      await storage.setBool(key, value);
    } catch (error) {
      throw Exception(error);
    }
  }
}
