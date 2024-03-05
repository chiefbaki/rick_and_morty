import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 28),
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Image.asset(
              Images.rick,
              width: 60,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  "Серия 1",
                  style: AppFonts.s10w500.copyWith(
                      color: AppColors.blue),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Пилот",
                  style: AppFonts.s16w500.copyWith(
                      color: AppColors.white),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "2 декабря 2013",
                  style: AppFonts.s14w400.copyWith(
                      color: AppColors.grey),
                ),
              ],
            )
          ],
        ));
  }
}
