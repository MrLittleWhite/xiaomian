import 'package:shared_preferences/shared_preferences.dart';
class XMPrefersKey {
  static const String autoPlay = "xm_auto_play";
  static const String playPeriod = "xm_play_period"; //mins
  static const String language = "xm_language"; 
}

class XMSharedPreferences {

  static SharedPreferences? shared;

  static Future<SharedPreferences> initialize() async {
    if (shared != null) {
      return Future(() => shared!);
    }
    return SharedPreferences.getInstance().then((value) {
      shared = value;
      return Future(() => value);
    });
  }

  static Future<bool> setInt(String key, int value) async {
    return initialize().then((prefs) => prefs.setInt(key, value));
  }

  static Future<bool> setBool(String key, bool value) async {
    return initialize().then((prefs) => prefs.setBool(key, value));
  }

  static Future<bool> setDouble(String key, double value) async {
    return initialize().then((prefs) => prefs.setDouble(key, value));
  }

  static Future<bool> setString(String key, String value) async {
    return initialize().then((prefs) => prefs.setString(key, value));
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return initialize().then((prefs) => prefs.setStringList(key, value));
  }

  static Future<int?> getInt(String key) async {
    return initialize().then((prefs) => prefs.getInt(key));
  }

  static Future<bool?> getBool(String key) async {
    return initialize().then((prefs) => prefs.getBool(key));
  }

  static Future<double?> getDouble(String key) async {
    return initialize().then((prefs) => prefs.getDouble(key));
  }

  static Future<String?> getString(String key) async {
    return initialize().then((prefs) => prefs.getString(key));
  }

  static Future<List<String>?> getStringList(String key) async {
    return initialize().then((prefs) => prefs.getStringList(key));
  }

  static Future<bool> remove(String key) async {
    return initialize().then((prefs) => prefs.remove(key));
  }

}

