import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/features/widgets/arrow_back_btn.dart';

class GridItem extends StatelessWidget {
  final String status;
  final String name;
  final String species;
  final String gender;
  final String img;
  const GridItem(
      {super.key,
      required this.status,
      required this.name,
      required this.img,
      required this.species,
    this.gender = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        img,
        width: 84,
      ),
      title: Text(
        status,
        style: AppFonts.s10w500.copyWith(color: setColor(text: status)),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppFonts.s16w500.copyWith(color: AppColors.white),
          ),
          Text(
            "$species, $gender",
            style: AppFonts.s12w400.copyWith(color: AppColors.grey),
          ),
        ],
      ),
      trailing: ArrowBackBtn(onPressed: () {
        context.router.push(const CharacterInfoRoute());
      }),
    );
  }

  Color setColor({required String text}) {
    if (text == "Alive") {
      return AppColors.green;
    } else if (text == "Dead") {
      return AppColors.red;
    } else {
      return AppColors.grey;
    }
  }
}
