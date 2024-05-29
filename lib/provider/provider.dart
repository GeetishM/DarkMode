import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  final darkTheme = ThemeData(
    primaryColor: const Color(0xff071213),
    brightness: Brightness.dark,
    primaryColorDark: const Color(0xff071213),
  );

  final lightTheme = ThemeData(
    primaryColor: const Color(0xfff4fcfd),
    brightness: Brightness.light,
    primaryColorDark: const Color(0xfff4fcfd),
  );

  void changeTheme(bool value) {
    _isDark = value;

    // Save the value to secure storage
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  Future<void> init() async {
    // After we run the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}
