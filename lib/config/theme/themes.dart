import 'package:clean_architecture/config/theme/custom_theme.dart';
import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

final CustomTheme theme = CustomTheme(
    lightTheme: ThemeData.light().copyWith(
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary,
      primaryColorDark: AppColors.primary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.black2,
      ),
      textTheme: textLightTheme,
      scaffoldBackgroundColor: AppColors.white1,
    ),
    darkTheme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.black1,
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primary,
      primaryColorDark: AppColors.primary,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.black2,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
      ),
      textTheme: textTheme,
    ));