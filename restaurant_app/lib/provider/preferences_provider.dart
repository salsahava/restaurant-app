import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyRecPreferences();
  }

  bool _isDailyRecActive = false;

  bool get isDailyRecActive => _isDailyRecActive;

  void _getDailyRecPreferences() async {
    _isDailyRecActive = await preferencesHelper.isDailyRecActive;
    notifyListeners();
  }

  void enableDailyRec(bool value) {
    preferencesHelper.setDailyRec(value);
    _getDailyRecPreferences();
  }
}
