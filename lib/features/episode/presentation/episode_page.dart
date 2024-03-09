import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/features/episode/presentation/cubit/episode_cubit.dart';
import 'package:rick_and_morty/features/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/widgets/episode_item.dart';

@RoutePage()
class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    BlocProvider.of<EpisodeCubit>(context).getEpisodes();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                CustomTextField(controller: controller, hintText: "Найти эпизод",),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: DefaultTabController(
                      length: 5,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          const TabBar(
                              labelPadding: EdgeInsets.symmetric(horizontal: 5),
                              indicatorColor: AppColors.white,
                              indicatorWeight: 3.0,
                              unselectedLabelColor: AppColors.grey,
                              labelColor: AppColors.white,
                              tabs: [
                                Tab(
                                  text: "СЕЗОН 1",
                                ),
                                Tab(
                                  text: "СЕЗОН 2",
                                ),
                                Tab(
                                  text: "СЕЗОН 3",
                                ),
                                Tab(
                                  text: "СЕЗОН 4",
                                ),
                                Tab(
                                  text: "СЕЗОН 5",
                                ),
                              ]),
                          const SizedBox(
                            height: 26,
                          ),
                          BlocBuilder<EpisodeCubit, EpisodeState>(
                              builder: (context, state) {
                            if (state is EpisodeLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is EpisodeSuccess) {
                              return Expanded(
                                child: TabBarView(children: [
                                  ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 24,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return EpisodeItem(
                                          series: state.model.results?[index]
                                                  .episode ??
                                              "",
                                          name: state
                                                  .model.results?[index].name ??
                                              "",
                                          date: state.model.results?[index]
                                                  .airDate ??
                                              "",
                                        );
                                      },
                                      itemCount:
                                          state.model.results?.length ?? 0),
                                  ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: 24,
                                          ),
                                      itemBuilder: (context, index) {
                                        return EpisodeItem(
                                          series: state.model.results?[index]
                                                  .episode ??
                                              "",
                                          name: state
                                                  .model.results?[index].name ??
                                              "",
                                          date: state.model.results?[index]
                                                  .airDate ??
                                              "",
                                        );
                                      },
                                      itemCount:
                                          state.model.results?.length ?? 0),
                                  ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: 24,
                                          ),
                                      itemBuilder: (context, index) {
                                        return EpisodeItem(
                                          series: state.model.results?[index]
                                                  .episode ??
                                              "",
                                          name: state
                                                  .model.results?[index].name ??
                                              "",
                                          date: state.model.results?[index]
                                                  .airDate ??
                                              "",
                                        );
                                      },
                                      itemCount:
                                          state.model.results?.length ?? 0),
                                  ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: 24,
                                          ),
                                      itemBuilder: (context, index) {
                                        return EpisodeItem(
                                          series: state.model.results?[index]
                                                  .episode ??
                                              "",
                                          name: state
                                                  .model.results?[index].name ??
                                              "",
                                          date: state.model.results?[index]
                                                  .airDate ??
                                              "",
                                        );
                                      },
                                      itemCount:
                                          state.model.results?.length ?? 0),
                                  ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                            height: 24,
                                          ),
                                      itemBuilder: (context, index) {
                                        return EpisodeItem(
                                          series: state.model.results?[index]
                                                  .episode ??
                                              "",
                                          name: state
                                                  .model.results?[index].name ??
                                              "",
                                          date: state.model.results?[index]
                                                  .airDate ??
                                              "",
                                        );
                                      },
                                      itemCount:
                                          state.model.results?.length ?? 0),
                                ]),
                              );
                            } else if (state is EpisodeError) {
                              debugPrint(state.error.toUpperCase());
                            }
                            return const SizedBox();
                          })
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
