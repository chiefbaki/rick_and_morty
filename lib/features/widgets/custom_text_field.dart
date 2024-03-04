import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppFonts.s16w400.copyWith(color: AppColors.grey),
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldColor,
          suffixIcon: Image.asset(Images.group),
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
            color: AppColors.grey,
          ),
          hintText: "Найти персонажа",
          hintStyle:
              AppFonts.s16w400.copyWith(color: AppColors.grey),
          contentPadding: const EdgeInsets.symmetric(
              ),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(50)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(50))),
    );
  }
}
