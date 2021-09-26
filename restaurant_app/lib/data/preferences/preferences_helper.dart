import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const DAILY_REC = 'DAILY_REC';

  Future<bool> get isDailyRecActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(DAILY_REC) ?? false;
  }

  void setDailyRec(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(DAILY_REC, value);
  }
}
