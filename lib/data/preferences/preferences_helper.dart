import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  static const DAILY_RESTAURANT = 'DAILY_RESTAURANT';

  Future<bool> get isDailyRestaurant async {
    final prefs = await sharedPreferences;
    return prefs.getBool(DAILY_RESTAURANT) ?? false;
  }

  void setRestaurant(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(DAILY_RESTAURANT, value);
  }
}