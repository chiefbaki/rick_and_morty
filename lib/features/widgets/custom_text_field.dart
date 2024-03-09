import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/main/presentation/pages/search_character_page.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeSettings>(context);
    String searchText = '';
    return TextField(
      onTap: () {
        showSearch(context: context, delegate: SearchCharacter());
      },
      controller: controller,
      onChanged: (value) {
        searchText = value;
      },
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
          hintText: hintText,
          hintStyle: AppFonts.s16w400.copyWith(color: AppColors.grey),
          contentPadding: const EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(50)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldColor),
              borderRadius: BorderRadius.circular(50))),
    );
  }
}
