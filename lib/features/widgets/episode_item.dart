import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

class EpisodeItem extends StatelessWidget {
  final String series;
  final String name;
  final String date;
  const EpisodeItem({
    super.key,
    required this.series,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Images.rick,
              width: 60,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  series,
                  style: AppFonts.s10w500.copyWith(color: AppColors.blue),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  name,
                  style: name.length < 32
                      ? AppFonts.s16w500.copyWith(color: AppColors.white)
                      : AppFonts.s14w500.copyWith(color: AppColors.white),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  date,
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
              ],
            )
          ],
        ));
  }
}
