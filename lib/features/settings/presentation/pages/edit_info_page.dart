import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';

import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/personal_info_field.dart';
import 'package:rick_and_morty/features/widgets/save_btn.dart';

@RoutePage()
class EditInfoPage extends StatelessWidget {
  const EditInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController middleNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(
          onPressed: () {
            context.router.pop();
          },
        ),
        title: const Text(
          "Изменить ФИО",
          style: AppFonts.s20w500,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 61),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Имя",
              style: AppFonts.s14w400.copyWith(color: AppColors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            PersonalInfoField(
              controller: firstNameController,
              hintText: "Имя",
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Фамилия",
              style: AppFonts.s14w400.copyWith(color: AppColors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            PersonalInfoField(
              controller: lastNameController,
              hintText: "Фамилия",
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Отчество",
              style: AppFonts.s14w400.copyWith(color: AppColors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            PersonalInfoField(
              controller: middleNameController,
              hintText: "Отчество",
            ),
            const Spacer(),
            CustomElevatedBtn(
              onPressed: () {},
              label: "Сохранить",
            ),
          ],
        ),
      ),
    );
  }
}
