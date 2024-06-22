import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  // create object shared preferences.
  static late SharedPreferences prefs;

  // this variable to check on user if completed
  // is user first used the app get the onboarding and and test screens
  static bool userCompletedTest = false;

  static inti() async {
    return prefs = await SharedPreferences.getInstance();
  }

  /// this to save if user complete test
  /// and this function is set key

  static Future<void> setData({
    required String key,
    required dynamic value,
  }) async {
    // save an boolean value to 'repeat' key.
    if (value is bool) {
      await prefs.setBool(
        key,
        value,
      );
    }
    if (value is String) {
      await prefs.setString(
        key,
        value,
      );
    }
    if (value is double) {
      await prefs.setDouble(
        key,
        value,
      );
    }
    if (value is int) {
      await prefs.setInt(
        key,
        value,
      );
    }
    print('set shared complete');
  }

  // this to get the user data
  static Future<Object?> getData({required String key}) async {
    prefs = await SharedPreferences.getInstance();
    // to get data from shared
    print('get shared complete');
    return await prefs.get(key);
  }

  // this if user exits mean used and he wanted to do the test again change the
  static void deleteLocalAuth({
    required String key,
  }) async {
    prefs = await SharedPreferences.getInstance();
    userCompletedTest = !userCompletedTest;
    await prefs.remove(key);
  }
}
