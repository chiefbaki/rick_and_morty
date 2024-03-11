import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/episode/presentation/cubit/episode_cubit.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_cubit.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_state.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/grid_list_item.dart';
import 'package:rick_and_morty/features/widgets/play_btn.dart';

@RoutePage()
class EpisodeInfoPage extends StatelessWidget {
  final String? name;

  final String? series;

  final String? date;

  const EpisodeInfoPage({super.key, this.name, this.series, this.date});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EpisodeCubit>(context).getEpisodes('');
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.episodebg,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50,
            child: BackBtn(onPressed: () {
              context.router.pop();
            }),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: AppColors.darkTheme,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 82,
                        ),
                        Center(
                          child: Text(
                            name ?? "",
                            style:
                                AppFonts.s24w700.copyWith(color: AppColors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Center(
                          child: Text(
                            series ?? "",
                            style: AppFonts.s12w400
                                .copyWith(color: AppColors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.",
                          style:
                              AppFonts.s13w400.copyWith(color: AppColors.white),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Премьера",
                          style:
                              AppFonts.s12w400.copyWith(color: AppColors.grey),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          date ?? "",
                          style: AppFonts.s14w400,
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        const Divider(
                          color: AppColors.grey,
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Text(
                          "Персонажи",
                          style:
                              AppFonts.s20w500.copyWith(color: AppColors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<CharacterCubit, CharacterState>(
                            builder: (context, state) {
                          if (state is CharacterLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is CharacterSuccess) {
                            return Expanded(
                                child: ListView.separated(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return GridItem(
                                          status: state.model?.results?[index]
                                                  .status ??
                                              "",
                                          name: state.model?.results?[index]
                                                  .name ??
                                              "",
                                          img: state.model?.results?[index]
                                                  .image ??
                                              "",
                                          species: state.model?.results?[index]
                                                  .species ??
                                              "",
                                          gender: state.model?.results?[index]
                                                  .gender ??
                                              "");
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 24,
                                      );
                                    },
                                    itemCount: 10));
                          } else if (state is CharacterError) {
                            debugPrint(state.error.toUpperCase());
                          }
                          return const SizedBox();
                        })
                      ],
                    ),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 320),
                  child: PlayBtn(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
