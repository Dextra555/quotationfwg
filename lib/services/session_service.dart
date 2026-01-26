import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_response_model.dart';

class SessionService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _isLoggedInKey = 'is_logged_in';

  // Save login session
  static Future<void> saveLoginSession(LoginResponse loginResponse) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Save token
    await prefs.setString(_tokenKey, loginResponse.data.token);
    
    // Save user data
    final userJson = jsonEncode(loginResponse.data.user.toJson());
    await prefs.setString(_userKey, userJson);
    
    // Save login state
    await prefs.setBool(_isLoggedInKey, true);
  }

  // Get saved token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Get saved user data
  static Future<User?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    
    if (userJson != null) {
      final userMap = jsonDecode(userJson) as Map<String, dynamic>;
      return User.fromJson(userMap);
    }
    return null;
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Clear session (logout)
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
    await prefs.remove(_isLoggedInKey);
  }
}
