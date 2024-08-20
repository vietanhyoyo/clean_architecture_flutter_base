import 'package:clean_architecture/core/constants/app_colors.dart';
import 'package:clean_architecture/core/constants/app_dimens.dart';
import 'package:clean_architecture/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  static TextStyle titleLG =
      TextStyle(fontSize: AppDimens.d24.sp, fontWeight: FontWeight.w700);
  static TextStyle titleMD =
      TextStyle(fontSize: AppDimens.d20.sp, fontWeight: FontWeight.w400);
  static TextStyle titleSM =
      TextStyle(fontSize: AppDimens.d16.sp, fontWeight: FontWeight.w400);
  static TextStyle bodySM =
      TextStyle(fontSize: AppDimens.d12.sp, fontWeight: FontWeight.w300);
}

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
      color: AppColors.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      fontFamily: AppFonts.roboto),
  displayMedium: TextStyle(
      color: AppColors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      height: 28 / 20,
      fontFamily: AppFonts.roboto),
  displaySmall: TextStyle(
      color: AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
      fontFamily: AppFonts.roboto),
  headlineMedium: TextStyle(
      color: AppColors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      height: 22 / 14,
      fontFamily: AppFonts.roboto),
  titleLarge: TextStyle(
      color: AppColors.white,
      fontFamily: AppFonts.roboto,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,
      height: 26 / 20),
  titleMedium: TextStyle(
      color: AppColors.white,
      fontFamily: AppFonts.roboto,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      height: 24 / 16),
  titleSmall: TextStyle(
      color: AppColors.white,
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyLarge: TextStyle(
      color: AppColors.white,
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodyMedium: TextStyle(
      color: AppColors.white,
      fontFamily: AppFonts.roboto,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      height: 22 / 14),
  bodySmall: TextStyle(
      color: AppColors.white,
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
