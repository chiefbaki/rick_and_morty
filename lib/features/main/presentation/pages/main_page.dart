import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_cubit.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_state.dart';
import 'package:rick_and_morty/features/widgets/custom_circle_progress.dart';
import 'package:rick_and_morty/features/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/widgets/grid_list_item.dart';
import 'package:rick_and_morty/features/widgets/list_item.dart';
import 'package:rick_and_morty/features/widgets/not_found_widget.dart';

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
    BlocProvider.of<CharacterCubit>(context).getDataCharacter('');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  CustomTextField(
                    controller: controller,
                    hintText: "Найти персонажа",
                    onTextChanged: (value) {
                      context.read<CharacterCubit>().getDataCharacter(value);
                      print(value);
                    },
                  ),
                  BlocBuilder<CharacterCubit, CharacterState>(
                      builder: (context, state) {
                    if (state is CharacterLoading) {
                      return const CustomCircleProgress();
                    } else if (state is CharacterSuccess) {
                      final results = state.model?.results ?? [];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ВСЕГО ПЕРСОНАЖЕЙ: ${state.model?.info?.count ?? ""}",
                                style: AppFonts.s10w500
                                    .copyWith(color: AppColors.grey),
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
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.67,
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return GridItem(
                                        img: results[index].image ?? "",
                                        status: results[index].status ?? "",
                                        name: results[index].name ?? "",
                                        species: results[index].species ?? "",
                                        gender: results[index].gender ?? "");
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 24,
                                    );
                                  },
                                  itemCount: results.length),
                            ),
                          ),
                          Visibility(
                              visible: isSelected,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.67,
                                child: GridView.builder(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemCount: results.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 24),
                                    itemBuilder: (context, index) {
                                      return ListItem(
                                        img: results[index].image ?? "",
                                        name: results[index].name ?? "",
                                        species: results[index].species ?? "",
                                        gender: results[index].gender ?? "",
                                        status: results[index].status ?? "",
                                      );
                                    }),
                              ))
                        ],
                      );
                    } else if (state is CharacterError) {
                      debugPrint(state.error.toUpperCase());
                      return const NotFoundWidget(img: Images.notFound);
                    }
                    return const SizedBox();
                  }),
                ],
              )),
        ),
      ),
    );
  }
}
