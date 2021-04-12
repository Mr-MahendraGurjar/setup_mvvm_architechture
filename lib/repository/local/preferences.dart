import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<T> get<T>(String key, dynamic defaultValue) async {
    var prefs = await SharedPreferences.getInstance();
    T result;

    if (defaultValue.runtimeType == Null) {
      var value = prefs.getString(key) as dynamic;
      return value;
    }

    switch (defaultValue.runtimeType) {
      case String:
        T value = prefs.getString(key) as T;
        result = value == null ? defaultValue : value;
        break;
      case bool:
        T value = prefs.getBool(key) as T;
        result = value == null ? defaultValue : value;
        break;
      case double:
        T value = prefs.getDouble(key) as T;
        result = value == null ? defaultValue : value;
        break;
      case int:
        T value = prefs.getInt(key) as T;
        result = value == null ? defaultValue : value;
        break;
      default:
        return defaultValue;
    }
    return result;
  }

  Future<void> put<T>(String key, T value) async {
    var prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await prefs.setString(key, value as String);
        break;
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
    }
  }

  Future<void> clearPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
