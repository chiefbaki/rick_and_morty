import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/features/widgets/arrow_back_btn.dart';

class CharacterInfoListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onPressed;
  const CharacterInfoListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppFonts.s14w400.copyWith(color: AppColors.grey),
      ),
      subtitle: Text(
        subtitle,
        style: AppFonts.s14w400.copyWith(color: AppColors.white),
      ),
      trailing: ArrowBackBtn(onPressed: onPressed),
    );
  }
}
