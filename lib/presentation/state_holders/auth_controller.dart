import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;

  static String? get accessToken => _accessToken;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
    log('Token: $_accessToken');
  }

  static Future<String?> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
    return _accessToken;
  }

  static Future<bool> isLoggedIn() async {
    String? token = await getAccessToken();
    return token != null;
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    _accessToken = null;
    log('Cleared');
  }
}
