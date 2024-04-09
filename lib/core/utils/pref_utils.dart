//ignore: unused_import
import 'dart:convert';
import 'package:santhom_connect/services/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setName(String value) {
    return _sharedPreferences!.setString('NAME', value);
  }

  String getName() {
    try {
      return _sharedPreferences!.getString('NAME') ?? "";
    } catch (e) {
      return "";
    }
  }

  Future<void> setEmail(String value) {
    return _sharedPreferences!.setString('EMAIL', value);
  }

  String getEmail() {
    try {
      return _sharedPreferences!.getString('EMAIL') ?? "";
    } catch (e) {
      return "";
    }
  }

  Future<void> setfamilyName(String value) {
    return _sharedPreferences!.setString('familyName', value);
  }

  String getfamilyName() {
    try {
      return _sharedPreferences!.getString('familyName') ?? "";
    } catch (e) {
      return "";
    }
  }

  Future<void> setfamilyHeadName(String value) {
    return _sharedPreferences!.setString('familyHeadName', value);
  }

  String getfamilyHeadName() {
    try {
      return _sharedPreferences!.getString('familyHeadName') ?? "";
    } catch (e) {
      return "";
    }
  }

  Future<void> setToken(String value) {
    return _sharedPreferences!.setString('TOKEN', value);
  }

  Future<String> getToken() async {
    try {
      String token = await checkToken() ?? "";
      print("token${token}");
      return token;
    } catch (e) {
      return "";
    }
  }
}
