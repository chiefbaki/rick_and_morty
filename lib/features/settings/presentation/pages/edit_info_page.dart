import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/core/utils/constants/consts.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';

import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/personal_info_field.dart';
import 'package:rick_and_morty/features/widgets/save_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class EditInfoPage extends StatefulWidget {
  const EditInfoPage({super.key});

  @override
  State<EditInfoPage> createState() => _EditInfoPageState();
}

class _EditInfoPageState extends State<EditInfoPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController lastName = TextEditingController();
    final TextEditingController middleName = TextEditingController();
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
              controller: name,
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
              controller: lastName,
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
              controller: middleName,
              hintText: "Отчество",
            ),
            const Spacer(),
            CustomElevatedBtn(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString(AppKeys.name, name.text);
                await prefs.setString(AppKeys.lastName, lastName.text);
                await prefs.setString(AppKeys.middleName, middleName.text);
                
                debugPrint("УСПЕШНО ИЗМЕНЕНО");
              },
              label: "Сохранить",
            ),
          ],
        ),
      ),
    );
  }
}
