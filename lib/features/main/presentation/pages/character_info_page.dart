import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/location/presentation/provider/location_provider.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/character_info_tile.dart';

@RoutePage()
class CharacterInfoPage extends StatelessWidget {
  const CharacterInfoPage(
      {super.key, this.name, this.gender, this.species, this.status, this.img});
  final String? name;
  final String? gender;
  final String? species;
  final String? status;
  final String? img;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LocationProvider>(context);
    print(vm.gender);
    print(vm.name);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Images.rickbg),
          Positioned(
            top: 40,
            left: 6,
            child: BackBtn(onPressed: () {
              context.router.pop();
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 180, horizontal: 135),
            child: Container(
              width: 160,
             decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkTheme
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: ClipOval(
                child: Image.network(img ?? "",),
               ),
             ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 260), //  Задать верные паддинги
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name ?? "",
                      style: AppFonts.s34w400.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      status ?? "",
                      style: AppFonts.s10w500.copyWith(color: AppColors.green),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.",
                      style: AppFonts.s13w400.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Пол",
                              style: AppFonts.s12w400
                                  .copyWith(color: AppColors.grey),
                            ),
                            Text(
                              gender ?? "",
                              style: AppFonts.s14w400
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 118,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Расса",
                              style: AppFonts.s12w400
                                  .copyWith(color: AppColors.grey),
                            ),
                            Text(
                              species ?? "",
                              style: AppFonts.s14w400
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CharacterInfoListTile(
                      onPressed: () {
                        context.router.push(const LocationInfoRoute());
                      },
                      title: "Место рождения",
                      subtitle: "Земля C-137",
                    ),
                    CharacterInfoListTile(
                      onPressed: () {
                        context.router.push(const LocationInfoRoute());
                      },
                      title: "Местоположение",
                      subtitle: "Земля (Измерение подменны)",
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    const Divider(
                      color: AppColors.textFieldColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Эпизоды",
                          style:
                              AppFonts.s20w500.copyWith(color: AppColors.white),
                        ),
                        Text(
                          "Все эпизоды",
                          style:
                              AppFonts.s12w400.copyWith(color: AppColors.grey),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // GridItem(
                    //   status: "Серия 1",
                    //   name: "Пилот",
                    //   img: Images.rick,
                    //   species: "2 декабря 2013",
                    // )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
