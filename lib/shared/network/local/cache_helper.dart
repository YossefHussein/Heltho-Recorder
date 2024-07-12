import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPref;

  static inti() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  // this function is save all data type
  static Future<bool> saveData({
    // this is key
    required String key,
    // this value and it's dynamic
    required dynamic value,
  }) async {
    if (value is String) return await sharedPref.setString(key, value);
    if (value is int) return await sharedPref.setInt(key, value);
    if (value is bool) return await sharedPref.setBool(key, value);
    return await sharedPref.setDouble(key, value);
  }

  static Future getData({required String key}) async {
    return sharedPref.getBool(key);
  }

  static Future removeData({required String key}) async {
    return await sharedPref.remove(key);
  }
}
