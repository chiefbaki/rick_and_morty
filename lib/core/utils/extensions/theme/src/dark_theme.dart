import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

final darkTheme = ThemeData(
  textTheme: TextTheme(
      titleLarge: AppFonts.s34w400.copyWith(color: AppColors.white),
      titleMedium: AppFonts.s24w700.copyWith(color: AppColors.white),
      titleSmall: AppFonts.s20w500.copyWith(color: AppColors.white),
      bodySmall: AppFonts.s13w400.copyWith(color: AppColors.white),
      bodyMedium: AppFonts.s14w400.copyWith(color: AppColors.white),
      bodyLarge: AppFonts.s16w500.copyWith(color: AppColors.white),
      headlineMedium: AppFonts.s14w500.copyWith(color: AppColors.white),
      headlineSmall: AppFonts.s16w400.copyWith(color: AppColors.white)),
  useMaterial3: false,
  brightness: Brightness.dark,
  inputDecorationTheme: const InputDecorationTheme(),
  scaffoldBackgroundColor: AppColors.darkTheme,
  appBarTheme:
      const AppBarTheme(elevation: 0, backgroundColor: AppColors.darkTheme),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.textFieldColor),
);
