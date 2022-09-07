import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SimplePreference {
  static SharedPreferences? _preferences;

  static clearPreferences() async {
    await _preferences!.clear();
  }

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future? setAccessToken(accessToken) async {
    await _preferences!.setString("accessToken", accessToken);
  }

  static Future? setRefreshToken(refreshToken) async {
    await _preferences!.setString("refreshToken", refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return _preferences!.getString("refreshToken");
  }

  static Future<String?> getAccessToken() async {
    return _preferences!.getString("accessToken");
  }

  Future<String> newAccessToken() async {
    Map<String, String> header = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    var response = await http.post(
      Uri.parse("http://10.0.2.2:4000/user/token"),
      headers: header,
      body: jsonEncode(
        {
          "token": await getRefreshToken(),
        },
      ),
    );
    return response.body;
  }
}
