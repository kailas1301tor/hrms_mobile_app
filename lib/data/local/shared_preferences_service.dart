import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // String operations
  static Future<bool> setString(String key, String value) async {
    return await _preferences?.setString(key, value) ?? false;
  }

  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Int operations
  static Future<bool> setInt(String key, int value) async {
    return await _preferences?.setInt(key, value) ?? false;
  }

  static int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  // Bool operations
  static Future<bool> setBool(String key, bool value) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  static bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  // Double operations
  static Future<bool> setDouble(String key, double value) async {
    return await _preferences?.setDouble(key, value) ?? false;
  }

  static double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  // List<String> operations
  static Future<bool> setStringList(String key, List<String> value) async {
    return await _preferences?.setStringList(key, value) ?? false;
  }

  static List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  // Remove
  static Future<bool> remove(String key) async {
    return await _preferences?.remove(key) ?? false;
  }

  // Clear all
  static Future<bool> clear() async {
    return await _preferences?.clear() ?? false;
  }

  // Check if key exists
  static bool containsKey(String key) {
    return _preferences?.containsKey(key) ?? false;
  }
}
