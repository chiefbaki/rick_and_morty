import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';


final lightTheme = ThemeData(
    textTheme: TextTheme(
        titleLarge: AppFonts.s34w400.copyWith(color: AppColors.black),
        titleMedium: AppFonts.s24w700.copyWith(color: AppColors.black),
        titleSmall: AppFonts.s20w500.copyWith(color: AppColors.black),
        bodySmall: AppFonts.s13w400.copyWith(color: AppColors.black),
        bodyMedium: AppFonts.s14w400.copyWith(color: AppColors.black),
        bodyLarge: AppFonts.s16w500.copyWith(color: AppColors.black),
        headlineMedium: AppFonts.s14w500.copyWith(color: AppColors.black),
        headlineSmall: AppFonts.s16w400.copyWith(color: AppColors.black)),
    useMaterial3: false,
    brightness: Brightness.light,
    inputDecorationTheme: const InputDecorationTheme(),
    appBarTheme:
        const AppBarTheme(elevation: 0, backgroundColor: AppColors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightGrey),
    scaffoldBackgroundColor: AppColors.white);


// TextStyle? displayLarge,
//     TextStyle? displayMedium,
//     TextStyle? displaySmall,
//     this.headlineLarge,
//     TextStyle? headlineMedium,
//     TextStyle? headlineSmall,
//     TextStyle? titleLarge,
//     TextStyle? titleMedium,
//     TextStyle? titleSmall,
//     TextStyle? bodyLarge,
//     TextStyle? bodyMedium,
//     TextStyle? bodySmall,
//     TextStyle? labelLarge,