import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/location/presentation/cubit/location_cubit_cubit.dart';
import 'package:rick_and_morty/features/widgets/custom_circle_progress.dart';
import 'package:rick_and_morty/features/widgets/custom_text_field.dart';
import 'package:rick_and_morty/features/widgets/location_cards.dart';
import 'package:rick_and_morty/features/widgets/not_found_widget.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationCubit>(context).getLocationData('');
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: controller,
                    hintText: "Найти локацию",
                    onTextChanged: (value) {
                      context.read<LocationCubit>().getLocationData(value);
                      debugPrint(value);
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<LocationCubit, LocationState>(
                      builder: (context, state) {
                    if (state is LocationLoading) {
                      return const CustomCircleProgress();
                    }
                    if (state is LocationSuccess) {
                      final results = state.model?.results ?? [];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ВСЕГО ЛОКАЦИЙ: ${state.model?.info!.count}",
                            style: AppFonts.s10w500
                                .copyWith(color: AppColors.grey),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.69,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return LocationCards(
                                    type: results[index].type ?? "",
                                    text: results[index].dimension ?? "",
                                    title: results[index].name ?? "",
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 24,
                                  );
                                },
                                itemCount: results.length),
                          )
                        ],
                      );
                    } else if (state is LocationError) {
                      debugPrint(state.error.toString().toUpperCase());
                      return const NotFoundWidget(img: Images.cucumber);
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

