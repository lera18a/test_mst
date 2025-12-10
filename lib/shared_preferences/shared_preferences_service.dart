import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const _key = 'subscribe';
  static Future<void> setSubscribed(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  static Future<bool> isSubscribed() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}
