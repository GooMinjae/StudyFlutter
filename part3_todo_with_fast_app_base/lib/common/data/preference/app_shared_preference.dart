import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  AppSharedPreference._();
  static AppSharedPreference instance = AppSharedPreference._();

  static const count = 'count';
  static const keyLaunchCount = 'keyLaunchCount';
  static const keyLaunchCount1 = 'keyLaunchCount1';

  late SharedPreferences _preferences;

  static init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }
  // void init() async {
  //   _preferences = await SharedPreferences.getInstance();
  // }

  // AppSharedPreference() {
  //   SharedPreferences.getInstance().then((value) => _preferences = value);
  // } // -> main() .에서 미리 초기화

  static void setCount(int count) {
    instance._preferences.setInt('count', count);
  }

  // null일 경우 0 default
  static int getCount() {
    return instance._preferences.getInt('count') ?? 0;
  }

  static void setLaunchCount(int count) {
    instance._preferences.setInt('keyLaunchCount', count);
  }

  // null일 경우 0 default
  static int getLaunchCount() {
    return instance._preferences.getInt('keyLaunchCount') ?? 0;
  }

  // main() {
  //   final preference = AppSharedPreference();
  //   preference.setCount(0);
  // }
}
