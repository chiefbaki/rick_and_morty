import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onTextChanged;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onTextChanged,
      style: AppFonts.s16w400.copyWith(color: AppColors.grey),
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldColor,
          suffixIcon:
              IconButton(onPressed: () {
                context.router.push(const FilterRoute());
              }, icon: Image.asset(Images.group)),
          prefixIcon: const Icon(
            Icons.search,
            size: 24,
            color: AppColors.grey,
          ),
          hintText: hintText,
          hintStyle: AppFonts.s16w400.copyWith(color: AppColors.grey),
          contentPadding: const EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(50)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(50))),
    );
  }
}
