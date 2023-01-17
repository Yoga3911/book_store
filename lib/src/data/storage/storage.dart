import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  const AppStorage._();

  static Future save(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static Future<String> load(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key)!;
  }
}
