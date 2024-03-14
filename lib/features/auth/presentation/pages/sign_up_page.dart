import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/constants/consts.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/core/utils/services/shared_prefs.dart';
import 'package:rick_and_morty/features/auth/cubit/auth_cubit.dart';
import 'package:rick_and_morty/features/widgets/auth_text_field.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/custom_circle_progress.dart';
import 'package:rick_and_morty/features/widgets/personal_info_field.dart';
import 'package:rick_and_morty/features/widgets/save_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController lastName = TextEditingController();
    final TextEditingController middleName = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    final prefs = Provider.of<SharedPrefs>(context);
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
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Создать аккаунт",
                    style: AppFonts.s34w400,
                  ),
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
                    controller: name,
                    hintText: "Имя",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Фамилия",
                    style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  PersonalInfoField(
                    controller: lastName,
                    hintText: "Фамилия",
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Отчество",
                    style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  PersonalInfoField(
                    controller: middleName,
                    hintText: "Отчество",
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
                    "Email",
                    style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AuthTextField(
                    controller: email,
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
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoading) {
                        debugPrint("LOADING AUTH");
                      } else if (state is AuthSuccess) {
                        debugPrint("SUCCESS AUTH");
                        Future.delayed(const Duration(seconds: 2), () {
                          context.router.push(const DashboardRoute());
                          return const CustomCircleProgress();
                        });
                      } else if (state is AuthError) {
                        debugPrint("ERROR AUTH");
                      }
                    },
                    child: CustomElevatedBtn(
                        onPressed: () async {
                          BlocProvider.of<AuthCubit>(context).makeSignUp(
                              email: email.text, password: password.text);
                          // prefs.initPrefs(key: AppKeys.name, value: name.text);
                          // prefs.initPrefs(
                          //     key: AppKeys.lastName, value: lastName.text);
                          // prefs.initPrefs(
                          //     key: AppKeys.middleName, value: middleName.text);
                          // prefs.initPrefs(
                          //     key: AppKeys.password, value: password.text);
                          // prefs.initPrefs(key: AppKeys.email, value: email.text);
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setString(AppKeys.name, name.text);
                          await prefs.setString(
                              AppKeys.lastName, lastName.text);
                          await prefs.setString(
                              AppKeys.middleName, middleName.text);
                          await prefs.setString(AppKeys.email, email.text);
                          await prefs.setString(
                              AppKeys.password, password.text);
                        },
                        label: "Создать"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
