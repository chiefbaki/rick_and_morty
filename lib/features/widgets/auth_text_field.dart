import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';


class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String icon;
  final bool obscureText;
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.icon,
      this.obscureText = false,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: AppFonts.s14w400.copyWith(color: AppColors.white),
      decoration: InputDecoration(
          prefixIcon: Image.asset(icon),
          filled: true,
          fillColor: AppColors.textFieldColor,
          hintText: hintText,
          hintStyle: AppFonts.s14w400.copyWith(color: AppColors.grey),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.textFieldColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.textFieldColor))),
    );
  }
}
