import 'package:shared_preferences/shared_preferences.dart';

class AppSetting<T> {
  AppSetting({
    required T defaultValue,
    required this.prefs,
    required this.key,
    this.saveOnSet = true,
  }) {
    _loadValue(defaultValue);
  }

  late T _value;

  final SharedPreferences prefs;

  final String key;

  final bool saveOnSet;

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    if (saveOnSet) saveValue();
  }

  void _loadValue(T defaultValue) {
    switch (T) {
      case bool:
        _value = (prefs.getBool(key) ?? defaultValue) as T;
        break;
      case int:
        _value = (prefs.getInt(key) ?? defaultValue) as T;
        break;
      case double:
        _value = (prefs.getDouble(key) ?? defaultValue) as T;
        break;
      case String:
        _value = (prefs.getString(key) ?? defaultValue) as T;
        break;
    }
  }

  Future<void> saveValue() async {
    switch (T) {
      case bool:
        await prefs.setBool(key, _value as bool);
        break;
      case int:
        await prefs.setInt(key, _value as int);
        break;
      case double:
        await prefs.setDouble(key, _value as double);
        break;
      case String:
        await prefs.setString(key, _value as String);
        break;
    }
  }
}
