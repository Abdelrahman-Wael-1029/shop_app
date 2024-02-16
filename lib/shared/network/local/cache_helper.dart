import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<bool> putData({
    required String key,
    required dynamic value,
  }) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static Future<dynamic> getData({
    required String key,
  }) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    return await sharedPreferences.remove(key);
  }

  static Future<bool> clearData() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    return await sharedPreferences.clear();
  }

  static Future<bool> containsData({
    required String key,
  }) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.containsKey(key);
  }
}
