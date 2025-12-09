import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await init();
    _prefs!.setString(key, value);
  }

  static Future<String> getString(String key) async {
    try {
      await init();
      return _prefs!.getString(key) ?? "";
    } catch (e) {
      return "";
    }
  }

  static remove(String key) async {
    await init();
    _prefs!.remove(key);
  }

  static clear() async {
    await init();
    _prefs!.clear();
  }
}
