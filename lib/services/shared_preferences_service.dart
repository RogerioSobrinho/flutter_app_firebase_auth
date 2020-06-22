import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  Future<bool> containsKey(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey(key);
  }

  saveStr(String key, String message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(key, message);
  }

  Future<String> readPrefStr(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  saveBool(String key, bool message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(key, message);
  }

  Future<bool> readPrefBool(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  saveInt(String key, int message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt(key, message);
  }

  Future<int> readPrefInt(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt(key);
  }

  saveDouble(String key, double message) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setDouble(key, message);
  }

  Future<double> readPrefDouble(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getDouble(key);
  }
}
