import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_dimens.dart';
import 'package:clean_architecture/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResText {
  static TextStyle titleLarge =
      TextStyle(fontSize: AppDimens.d26.sp, fontWeight: FontWeight.w600);
  static TextStyle whiteTitleLarge = TextStyle(
      fontSize: AppDimens.d26.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white);
  static const TextStyle cardName = TextStyle(height: 1);
  static TextStyle songName = TextStyle(fontSize: 13.sp);
  static TextStyle movieTitle =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);
  static const TextStyle primary = TextStyle(color: AppColors.primary);
  static const TextStyle grey = TextStyle(color: AppColors.grey);
  static const TextStyle white = TextStyle(color: AppColors.white);
  static const TextStyle black2 = TextStyle(color: AppColors.black2);
}

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      fontFamily: AppFonts.roboto),
  displayMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      fontFamily: AppFonts.roboto),
  displaySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      fontFamily: AppFonts.roboto),
  headlineMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: 22 / 14,
      fontFamily: AppFonts.roboto),
  titleLarge: TextStyle(
      fontFamily: AppFonts.roboto,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,
      height: 26 / 20),
  titleMedium: TextStyle(
      fontFamily: AppFonts.roboto,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      height: 24 / 16),
  titleSmall: TextStyle(
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyLarge: TextStyle(
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyMedium: TextStyle(
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodySmall: TextStyle(
      fontFamily: AppFonts.roboto,
      fontSize: 13.sp,
      fontWeight: FontWeight.w300,
      height: 20 / 13),
).apply();

TextTheme textLightTheme = TextTheme(
  displayLarge: TextStyle(
      color: AppColors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      fontFamily: AppFonts.roboto),
  displayMedium: TextStyle(
      color: AppColors.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      fontFamily: AppFonts.roboto),
  displaySmall: TextStyle(
      color: AppColors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      fontFamily: AppFonts.roboto),
  headlineMedium: TextStyle(
      color: AppColors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: 22 / 14,
      fontFamily: AppFonts.roboto),
  titleLarge: TextStyle(
      color: AppColors.black,
      fontFamily: AppFonts.roboto,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,
      height: 26 / 20),
  titleMedium: TextStyle(
      color: AppColors.black,
      fontFamily: AppFonts.roboto,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      height: 24 / 16),
  titleSmall: TextStyle(
      color: AppColors.black,
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyLarge: TextStyle(
      color: AppColors.black,
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyMedium: TextStyle(
      color: AppColors.black,
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodySmall: TextStyle(
      color: AppColors.black,
      fontFamily: AppFonts.roboto,
      fontSize: 13.sp,
      fontWeight: FontWeight.w300,
      height: 20 / 13),
).apply();