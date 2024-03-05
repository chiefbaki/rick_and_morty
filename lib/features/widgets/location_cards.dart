import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

import '../../core/config/theme/app_colors.dart';

class LocationCards extends StatelessWidget {
  const LocationCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.26,
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.asset(
                Images.earth,
                fit: BoxFit.scaleDown,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Земля C-137",
                  style: AppFonts.s20w500.copyWith(color: AppColors.white),
                ),
                Text(
                  "Мир Измерение С-137",
                  style: AppFonts.s12w400.copyWith(color: AppColors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
