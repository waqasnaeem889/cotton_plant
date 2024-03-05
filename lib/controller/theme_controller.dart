// ignore_for_file: constant_pattern_never_matches_value_type, unrelated_type_equality_checks

import 'package:cotton_plant/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final BuildContext context;

  ThemeController(this.context);

  ThemeData currentTheme = AppThemes.themeDataLight;
  String theme = ThemeOptions.light;
  
  bool isDark() {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  @override
  void onInit() {
    super.onInit();
    getThemeState();
  }

  Future<void> getThemeState() async {
    final storage = await SharedPreferences.getInstance();
    final String? themeInStorage = storage.getString(LocalStorageKeys.theme);
    if (themeInStorage != null) {
      return setTheme(themeInStorage);
    } else {
      return setTheme(ThemeOptions.light);
    }
  }

  Future<void> getThemeName() async {
    final storage = await SharedPreferences.getInstance();
    final String? themeInStorage = storage.getString(LocalStorageKeys.theme);
    if (themeInStorage != null) {
      return setNameTheme(themeInStorage);
    } else {
      return setNameTheme(ThemeOptions.light);
    }
  }

  void setNameTheme(String value) {
    theme = value;
    update();
  }

  Future<void> setTheme(String value) async {
    theme = value;
    if (value == ThemeOptions.light) changeTheme(ThemeOptions.light);
    if (value == ThemeOptions.dark) changeTheme(ThemeOptions.dark);
    final storage = await SharedPreferences.getInstance();
    await storage.setString(LocalStorageKeys.theme, value);
    update();
  }

  void changeTheme(String theme) {
    switch (theme) {
      case ThemeOptions.light:
        currentTheme = AppThemes.themeDataLight;
        theme = ThemeOptions.light;
        break;
      case ThemeOptions.dark:
        currentTheme = AppThemes.themeDataDark;
        theme = ThemeOptions.dark;
        break;
    }
    update();
  }
}

class ThemeOptions {
  static const String light = 'light';
  static const String dark = 'dark';
}


class LocalStorageKeys {
  static String theme = 'theme';
}

