import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/edit_image_btn.dart';
import 'package:rick_and_morty/features/widgets/personal_info_tile.dart';

@RoutePage()
class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(
          onPressed: () {
            context.router.pop();
          },
        ),
        title: const Text(
          "Редактировать профиль",
          style: AppFonts.s20w500,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 41),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    Images.morty,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  EditImageBtn(
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 41,
            ),
            Text(
              "Профиль",
              style: AppFonts.s10w500.copyWith(color: AppColors.grey),
            ),
            const SizedBox(
              height: 24,
            ),
            PersonalInfoTile(
              title: "Изменить ФИО",
              subtitle: "Oleg Belotserkovsky",
              onPressed: () {
                context.router.push(const EditInfoRoute());
              },
            ),
            PersonalInfoTile(
              title: "Логин",
              subtitle: "Rick",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
