import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late SharedPreferences prefs;

  // Define key
  static const String _accessTokenKey = "access_token";

  // Constructor
  Storage() {
    _initialize();
  }

  // Initialize SharedPreferences
  Future<void> _initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Save access token
  static Future<void> saveAccessToken(String token) async {
    await prefs.setString(_accessTokenKey, token);
  }

  // Retrieve access token
  static String? getAccessToken() {
    return prefs.getString(_accessTokenKey);
  }

  // Remove access token
  static Future<void> removeAccessToken() async {
    await prefs.remove(_accessTokenKey);
  }
}
