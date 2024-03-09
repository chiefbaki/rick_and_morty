import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

class CreateBtn extends StatelessWidget {
  final Function() onPressed;
  const CreateBtn({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          "Создать",
          style:
              AppFonts.s14w400.copyWith(color: AppColors.green),
        ));
  }
}