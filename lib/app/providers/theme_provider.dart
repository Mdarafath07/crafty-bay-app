import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'themeMode';

  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode => _currentThemeMode;


  Future<void> loadInitialThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString(_themeKey);

    if (savedTheme != null) {
      _currentThemeMode = _getThemeModeFromString(savedTheme);
    }

    notifyListeners();
  }


  Future<void> changeTheme(ThemeMode mode) async {
    if (_currentThemeMode == mode) return;

    _currentThemeMode = mode;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);

    notifyListeners();
  }

  ThemeMode _getThemeModeFromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
