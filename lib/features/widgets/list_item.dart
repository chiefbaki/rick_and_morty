
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Images.imgBig,
          width: 120,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          "живой",
          style: AppFonts.s10w500.copyWith(color: AppColors.green),
        ),
        Text(
          "Рик Санчез",
          style: AppFonts.s14w500.copyWith(color: AppColors.white),
        ),
        Text(
          "Человек, Мужской",
          style: AppFonts.s12w400.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
