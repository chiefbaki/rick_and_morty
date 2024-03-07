import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/widgets/arrow_back_btn.dart';
import 'package:rick_and_morty/features/widgets/character_info_tile.dart';
import 'package:rick_and_morty/features/widgets/grid_list_item.dart';

@RoutePage()
class CharacterInfoPage extends StatelessWidget {
  const CharacterInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(Images.rickbg),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 180, horizontal: 135),
            child: CircleAvatar(
              radius: 80,
              child: Image.asset(
                Images.rickava,
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
                      "Рик Cанчез",
                      style: AppFonts.s34w400.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Живой",
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
                              "Мужской",
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
                              "Человек",
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
                    GridItem(
                      status: "Серия 1",
                      name: "Пилот",
                      img: Images.rick,
                      species: "2 декабря 2013",
                    )
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
