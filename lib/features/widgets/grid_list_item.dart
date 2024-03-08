import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/extensions/colors.dart';
import 'package:rick_and_morty/features/location/presentation/provider/location_provider.dart';
import 'package:rick_and_morty/features/main/presentation/pages/character_info_page.dart';
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
      required this.gender});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LocationProvider>(context);
    vm.getModel(
        genderM: gender,
        nameM: name,
        speciesM: species,
        imgM: img,
        statusM: status);
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
        debugPrint(200.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterInfoPage(
                      name: name,
                      gender: gender,
                      species: species,
                      status: status,
                      img: img,
                    )));
      }),
    );
  }
}
