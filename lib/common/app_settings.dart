import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixteen_million_taps/common/app_setting.dart';

class AppSettings {
  late final AppSetting<int> index;

  /// Loads app settings from persistent storage.
  Future<void> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    index = AppSetting<int>(defaultValue: 0, prefs: prefs, key: 'index');
  }
}
