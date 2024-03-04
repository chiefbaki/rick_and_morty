import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Images.img),
      title: Text(
        "Живой",
        style: AppFonts.s10w500.copyWith(color: AppColors.green),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Рик Cанчез",
            style: AppFonts.s16w500.copyWith(color: AppColors.white),
          ),
          Text(
            "Человек, Мужской",
            style: AppFonts.s12w400.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
