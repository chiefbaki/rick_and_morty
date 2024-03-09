import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

TextTheme createTextTheme(){
  return TextTheme(
    headlineMedium: AppFonts.s34w400.copyWith(color: AppColors.black)
  );
}

//  TextStyle? displayLarge,
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
//     this.labelMedium,
//     TextStyle? labelSmall,