import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/features/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/widgets/episode_item.dart';

@RoutePage()
class EpisodePage extends StatelessWidget {
  const EpisodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                CustomTextField(controller: controller),
                const SizedBox(
                  height: 8,
                ),
                const Flexible(
                  child: DefaultTabController(
                      length: 5,
                      initialIndex: 0,
                      child: Column(
                        children: [
                            TabBar(
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
                          Expanded(
                            child: TabBarView(children: [
                              EpisodeItem(),
                              EpisodeItem(),
                              EpisodeItem(),
                              EpisodeItem(),
                              EpisodeItem(),
                            ]),
                          )
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
