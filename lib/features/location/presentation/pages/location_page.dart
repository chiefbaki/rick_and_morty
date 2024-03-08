import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/features/location/presentation/cubit/location_cubit_cubit.dart';
import 'package:rick_and_morty/features/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/widgets/location_cards.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationCubit>(context).getLocationData();
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
              if (state is LocationLoading) {
                debugPrint("loading");
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LocationSuccess) {
                debugPrint("success");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(controller: controller, hintText: "Найти локацию",),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "ВСЕГО ЛОКАЦИЙ: ${state.model.info!.count}",
                      style: AppFonts.s10w500.copyWith(color: AppColors.grey),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return LocationCards(
                              type: state.model.results?[index].type ?? "",
                              text: state.model.results?[index].dimension ?? "",
                              title: state.model.results?[index].name ?? "",
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 24,
                            );
                          },
                          itemCount: state.model.results!.length),
                    )
                  ],
                );
              } else if (state is LocationError) {
                debugPrint(state.error.toString().toUpperCase());
              }
              return const SizedBox();
            }),
          ),
        ),
      ),
    );
  }
}
