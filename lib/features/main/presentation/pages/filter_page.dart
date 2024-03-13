import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/core/utils/services/shared_prefs.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/sort_btn.dart';

@RoutePage()
class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<Map<String, dynamic>> statusValues = [
    {"name": "Alive", "isChecked": false},
    {"name": "Dead", "isChecked": false},
    {"name": "Unknown", "isChecked": false},
  ];
  final List<Map<String, dynamic>> genderValues = [
    {"name": "Female", "isChecked": false},
    {"name": "Male", "isChecked": false},
    {"name": "Unknown", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SharedPrefs>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackBtn(
                    onPressed: () {
                      context.router.pop();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Фильтры",
                    style: AppFonts.s20w500.copyWith(color: AppColors.white),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        vm.clearChoice();
                      },
                      icon: Image.asset(
                        Images.clear,
                        width: 30,
                      ))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Сортировать",
                style: AppFonts.s10w500.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 29,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "По алфавиту ",
                    style: AppFonts.s16w400.copyWith(color: AppColors.white),
                  ),
                  Row(
                    children: [
                      SortBtn(
                        onPressed: () {},
                        img: Images.sort1,
                      ),
                      SortBtn(
                        onPressed: () {},
                        img: Images.sort2,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              const Divider(
                color: AppColors.grey,
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                "Статус",
                style: AppFonts.s10w500.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                  children: statusValues.map((e) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: AppColors.blue,
                  side: const BorderSide(color: AppColors.grey),
                  title: Text(
                    e["name"],
                    style: AppFonts.s16w400.copyWith(color: AppColors.white),
                  ),
                  value: e["isChecked"],
                  onChanged: (newValue) {
                    setState(() {
                      e["isChecked"] = newValue;
                      vm.setStatus(e["name"]);
                      debugPrint(vm.status);
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                );
              }).toList()),
              const SizedBox(
                height: 36,
              ),
              const Divider(
                color: AppColors.grey,
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                "Пол",
                style: AppFonts.s10w500.copyWith(color: AppColors.grey),
              ),
              Column(
                  children: genderValues.map((e) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: AppColors.blue,
                  side: const BorderSide(color: AppColors.grey),
                  title: Text(
                    e["name"],
                    style: AppFonts.s16w400.copyWith(color: AppColors.white),
                  ),
                  value: e["isChecked"],
                  onChanged: (newValue) {
                    setState(() {
                      e["isChecked"] = newValue;
                      vm.setGender(e["name"]);
                      debugPrint(vm.gender);
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                );
              }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
