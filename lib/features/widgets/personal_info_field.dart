import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

class PersonalInfoField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const PersonalInfoField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppFonts.s16w400.copyWith(color: AppColors.white),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppFonts.s16w400.copyWith(color: AppColors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          filled: true,
          fillColor: AppColors.textFieldColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.textFieldColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.textFieldColor))),
    );
  }
}
