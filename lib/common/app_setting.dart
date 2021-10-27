import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSetting<T> {
  AppSetting({
    required T defaultValue,
    required this.prefs,
    required this.key,
    this.saveOnSet = true,
  }) {
    loadValue(defaultValue);
  }

  late T _value;

  final SharedPreferences prefs;

  final String key;

  final bool saveOnSet;

  T get value => _value;

  set value(T value) {
    _value = value;
    if (saveOnSet) _saveValue(value);
  }

  void loadValue(T defaultValue) {
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

  Future<void> _saveValue(T value) async {
    switch (T) {
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case String:
        await prefs.setString(key, value as String);
        break;
    }
  }
}
