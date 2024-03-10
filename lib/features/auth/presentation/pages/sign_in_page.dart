import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/widgets/auth_text_field.dart';
import 'package:rick_and_morty/features/widgets/create_btn.dart';
import 'package:rick_and_morty/features/widgets/save_btn.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController login = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Images.splashText,
                    width: 267,
                    height: 376,
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Text(
                  "Логин",
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
                const SizedBox(
                  height: 8,
                ),
                AuthTextField(
                  controller: login,
                  hintText: "Email",
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
                  controller: password,
                  hintText: "Пароль",
                  obscureText: true,
                  icon: Images.pass,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomElevatedBtn(onPressed: () {
                  context.router.push(const DashboardRoute());
                }, label: "Войти"),
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
                      onPressed: () {
                        context.router.push(const SignUpRoute());
                      }, 
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
