import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

class ListItem extends StatelessWidget {
  final String name;
  final String status;
  final String img;
  final String species;
  final String gender;
  const ListItem(
      {super.key,
      required this.name,
      required this.status,
      required this.species,
      required this.gender, required this.img
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          img,
          width: 120,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          status,
          style: AppFonts.s10w500.copyWith(color: status == "Alive" ? AppColors.green : AppColors.red),
        ),
        Text(
          name,
          style: AppFonts.s14w500.copyWith(color: AppColors.white),
        ),
        Text(
          "$species, $gender",
          style: AppFonts.s12w400.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }
}
