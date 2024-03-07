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
import 'package:rick_and_morty/features/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/widgets/grid_list_item.dart';
import 'package:rick_and_morty/features/widgets/list_item.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool isSelected = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getDataCharacter();
    final vm = Provider.of<LocationProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: BlocBuilder<CharacterCubit, CharacterState>(
                builder: (context, state) {
              if (state is CharacterLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CharacterSuccess) {
                vm.setModel(state.model);
                debugPrint(state.model.info?.count.toString());
                return Column(
                  children: [
                    CustomTextField(
                      controller: controller,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ВСЕГО ПЕРСОНАЖЕЙ: ${state.model.info?.count ?? ""}",
                          style:
                              AppFonts.s10w500.copyWith(color: AppColors.grey),
                        ),
                        IconButton(
                            onPressed: () {
                              isSelected = !isSelected;
                              setState(() {});
                            },
                            icon: isSelected
                                ? Image.asset(
                                    Images.list,
                                    width: 24,
                                  )
                                : Image.asset(
                                    Images.grid,
                                    width: 24,
                                  )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: !isSelected,
                      child: Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GridItem(
                                  img: state.model.results?[index].image ?? "",
                                  status:
                                      state.model.results?[index].status ?? "",
                                  name: state.model.results?[index].name ?? "",
                                  species:
                                      state.model.results?[index].species ?? "",
                                  gender:
                                      state.model.results?[index].gender ?? "");
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 24,
                              );
                            },
                            itemCount: state.model.results?.length ?? 0),
                      ),
                    ),
                    Visibility(
                        visible: isSelected,
                        child: Expanded(
                          child: GridView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: state.model.results?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 24),
                              itemBuilder: (context, index) {
                                return ListItem(
                                  img: state.model.results?[index].image ?? "",
                                  name: state.model.results?[index].name ?? "",
                                  species:
                                      state.model.results?[index].species ?? "",
                                  gender:
                                      state.model.results?[index].gender ?? "",
                                  status:
                                      state.model.results?[index].status ?? "",
                                );
                              }),
                        ))
                  ],
                );
              } else if (state is CharacterError) {
                debugPrint(state.error.toUpperCase());
              }
              return const SizedBox();
            }),
          ),
        ),
      ),
    );
  }
}
