import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

import 'package:rick_and_morty/features/widgets/arrow_back_btn.dart';

class EpisodeEl extends StatelessWidget {
  final String series;
  final String name;
  final String date;
  const EpisodeEl({
    super.key,
    required this.series,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        Images.rickava,
        width: 60,
        height: 74,
        fit: BoxFit.fill,
      ),
      title: Text(
        series,
        style: AppFonts.s10w500.copyWith(color: AppColors.blue),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppFonts.s16w500.copyWith(color: AppColors.white),
          ),
          Text(
            date,
            style: AppFonts.s12w400.copyWith(color: AppColors.grey),
          ),
        ],
      ),
      trailing: ArrowBackBtn(onPressed: () {
        context.router.push(EpisodeInfoRoute(name: name, date: date, series: series));
      }),
    );
  }
}
