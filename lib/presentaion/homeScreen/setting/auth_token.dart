import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenProvider {
  static const String _tokenKey = "token";

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    print(" Token saved: $token");
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(_tokenKey);
    print(" Current token: $token");
    return token;
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey); // remove the token
    print(" Token cleared from storage");
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print(" All SharedPreferences cleared");
  }
}
