import 'package:clean_architecture/config/theme/custom_theme.dart';
import 'package:clean_architecture/config/theme/themes.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final CustomTheme currentTheme = theme;
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
}