import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/auth/cubit/auth_cubit.dart';
import 'package:rick_and_morty/features/widgets/auth_text_field.dart';
import 'package:rick_and_morty/features/widgets/create_btn.dart';
import 'package:rick_and_morty/features/widgets/custom_circle_progress.dart';
import 'package:rick_and_morty/features/widgets/save_btn.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: SingleChildScrollView(
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
                        debugPrint("LOADING LOGIN");
                      } else if (state is AuthSuccess) {
                        Future.delayed(const Duration(seconds: 2), () {
                          context.router.push(const DashboardRoute());
                          return const CustomCircleProgress();
                        });
                      } else if (state is AuthError) {
                        debugPrint("ERROR AUTH");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                title: Text(
                                  "Ошибка",
                                  style: AppFonts.s20w500
                                      .copyWith(color: AppColors.darkTheme),
                                ),
                                content: Text(
                                  "Введен  неверные логин или пароль",
                                  style: AppFonts.s14w400
                                      .copyWith(color: AppColors.darkTheme),
                                ),
                                actions: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        width: 259,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: AppColors.blue),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                
                                                backgroundColor: Colors.transparent,
                                                elevation: 0,
                                                enabledMouseCursor:
                                                    MouseCursor.defer),
                                            child: Text(
                                              "Ok",
                                              style: AppFonts.s16w400.copyWith(
                                                  color: AppColors.blue),
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: CustomElevatedBtn(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context).makeSignIn(
                              email: email.text, password: password.text);
                        },
                        label: "Войти"),
                  ),
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
      ),
    );
  }
}
