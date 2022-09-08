import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  Future<String?> addStringToSP(
      {required String key, required String value}) async {
    String? savedData;
    final prefs = await SharedPreferences.getInstance();
    final val = await prefs.setString(key, value);
    if (val == true) {
      savedData = value;
    } else {
      savedData = null;
    }
    return savedData;
  }

  Future<String?> getStringFromSp({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

LocalData localData = LocalData();
