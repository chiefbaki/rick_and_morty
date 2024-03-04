import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                CustomTextField(
                  controller: controller,
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Всего персонажей: 200",
                      style: AppFonts.s10w500.copyWith(color: AppColors.grey),
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
                          return const GridItem();
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 24,
                          );
                        },
                        itemCount: 10),
                  ),
                ),
                Visibility(
                  visible: isSelected,
                  child: Expanded(
                          child: GridView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: 10,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 24),
                              itemBuilder: (context, index) {
                                return const ListItem();
                              }),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
