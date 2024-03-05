import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';

class EditImageBtn extends StatelessWidget {
  final Function() onPressed;
  const EditImageBtn({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          "Изменить фото",
          style: AppFonts.s16w400.copyWith(color: AppColors.blue),
        ));
  }
}
