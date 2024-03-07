import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/character/presentation/cubits/character_cubit.dart';
import 'package:rick_and_morty/features/character/presentation/cubits/character_state.dart';
import 'package:rick_and_morty/features/location/presentation/provider/location_provider.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/grid_list_item.dart';

@RoutePage()
class LocationInfoPage extends StatelessWidget {
  const LocationInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LocationProvider>(context);
    BlocProvider.of<CharacterCubit>(context).getDataCharacter();
    print(vm.getCharacterModel.results?[0].name);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.earth1,
            fit: BoxFit.contain,
          ),
          Positioned(
            top: 50,
            child: BackBtn(onPressed: () {
              context.router.pop();
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 320),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: AppColors.darkTheme,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Земля C-137",
                      style: AppFonts.s24w700.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Мир Измерение С-137",
                      style: AppFonts.s12w400.copyWith(color: AppColors.grey),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.",
                      style: AppFonts.s13w400.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Персонажи",
                      style: AppFonts.s20w500.copyWith(color: AppColors.white),
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
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView.separated(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GridItem(
                                      status:
                                          state.model.results?[index].status ??
                                              "",
                                      name: state.model.results?[index].name ??
                                          "",
                                      img: state.model.results?[index].image ??
                                          "",
                                      species:
                                          state.model.results?[index].species ??
                                              "",
                                      gender:
                                          state.model.results?[index].gender ??
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
          )
        ],
      ),
    );
  }
}
