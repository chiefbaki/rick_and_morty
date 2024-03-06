import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/widgets/auth_text_field.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/create_btn.dart';
import 'package:rick_and_morty/features/widgets/personal_info_field.dart';
import 'package:rick_and_morty/features/widgets/save_btn.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackBtn(
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 65,
                ),
                Text(
                  "Имя",
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                PersonalInfoField(
                  controller: TextEditingController(),
                  hintText: "Имя",
                ),
                Text(
                  "Фамилия",
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                PersonalInfoField(
                  controller: TextEditingController(),
                  hintText: "Фамилия",
                ),
                Text(
                  "Фамилия",
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                PersonalInfoField(
                  controller: TextEditingController(),
                  hintText: "Отчество",
                ),
                const SizedBox(
                  height: 36,
                ),
                const Divider(
                  color: AppColors.green,
                ),
                const SizedBox(
                  height: 36,
                ),
                Text(
                  "Логин",
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                AuthTextField(
                  controller: TextEditingController(),
                  hintText: "Логин",
                  icon: Images.user,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Пароль",
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                AuthTextField(
                  controller: TextEditingController(),
                  hintText: "Пароль",
                  obscureText: true,
                  icon: Images.pass,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomElevatedBtn(onPressed: () {}, label: "Войти"),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "У вас еще нет аккаунта?",
                      style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                    ),
                    CreateBtn(
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
