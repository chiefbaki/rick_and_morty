import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/constants/consts.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/theme_manager.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/widgets/arrow_back_btn.dart';
import 'package:rick_and_morty/features/widgets/edit_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final List<String> options = [
    "Выключено",
    "Включено",
    "Следовать настройкам системы",
    "В режиме энергоснабжения"
  ];
  String currentOption = "not selected";
  ThemeManager themeManager = ThemeManager();

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString(AppKeys.name) ?? "";
    lastName = prefs.getString(AppKeys.lastName) ?? "";
    email = prefs.getString(AppKeys.email) ?? "";

    setState(() {});
  }

  late String name = "name";
  late String lastName = "name";
  late String email = "name";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  
  @override
  Widget build(BuildContext context) {
    // final prefs = Provider.of<SharedPrefs>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Настройки",
          style: AppFonts.s20w500,
        ),
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    Images.morty,
                    width: 80,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$name $lastName",
                        style:
                            AppFonts.s16w400.copyWith(color: AppColors.white),
                      ),
                      Text(
                        email,
                        style: AppFonts.s16w400.copyWith(color: AppColors.grey),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              EditBtn(
                onPressed: () {
                  context.router.push(const PersonalInfoRoute());
                },
              ),
              const SizedBox(
                height: 32,
              ),
              const Divider(
                color: AppColors.grey,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                "Внешний вид",
                style: AppFonts.s10w500.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              ListTile(
                leading: Image.asset(
                  Images.palette,
                  width: 38,
                ),
                title: Text(
                  "Темная тема",
                  style: AppFonts.s16w400.copyWith(color: AppColors.white),
                ),
                subtitle: Text(
                  "Включена",
                  style: AppFonts.s14w400.copyWith(color: AppColors.grey),
                ),
                trailing: ArrowBackBtn(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          insetPadding: EdgeInsets.zero,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Отмена",
                                style: AppFonts.s14w500
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ],
                          backgroundColor: AppColors.darkTheme,
                          title: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Темная тема",
                              style: AppFonts.s20w500
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                          content: SizedBox(
                            height: 230,
                            child: Column(
                              children: [
                                RadioListTile(
                                  title: Text(
                                    "Выключено",
                                    style: AppFonts.s16w400
                                        .copyWith(color: AppColors.white),
                                  ),
                                  value: options[0],
                                  groupValue: currentOption,
                                  onChanged: (val) {
                                    setState(() {
                                      currentOption = val!;
                                    });
                                    print(val);
                                    Navigator.pop(context);
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    "Включено",
                                    style: AppFonts.s16w400
                                        .copyWith(color: AppColors.white),
                                  ),
                                  value: options[1],
                                  groupValue: currentOption,
                                  selected: true,
                                  onChanged: (val) {
                                    setState(() {
                                      currentOption = val!;
                                    });
                                    print(val);
                                    themeManager.changeTheme();
                                    Navigator.pop(context);
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    "Следовать настройкам системы",
                                    style: AppFonts.s16w400
                                        .copyWith(color: AppColors.white),
                                  ),
                                  value: options[2],
                                  groupValue: currentOption,
                                  onChanged: (val) {
                                    setState(() {
                                      currentOption = val!;
                                    });
                                    print(val);
                                    Navigator.pop(context);
                                  },
                                ),
                                RadioListTile(
                                  title: Text(
                                    "В режиме энергосбережения",
                                    style: AppFonts.s16w400
                                        .copyWith(color: AppColors.white),
                                  ),
                                  value: options[3],
                                  groupValue: currentOption,
                                  onChanged: (val) {
                                    setState(() {
                                      currentOption = val!;
                                    });
                                    print(val);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              const Divider(
                color: AppColors.grey,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                "О приложении",
                style: AppFonts.s10w500.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Зигерионцы помещают Джерри и Рика в симуляцию,чтобы узнать секрет изготовления концен-трирован- ной темной материи.",
                style: AppFonts.s13w400.copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 26,
              ),
              const Divider(
                color: AppColors.grey,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                "Версия приложения",
                style: AppFonts.s10w500.copyWith(color: AppColors.grey),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Rick & Morty  v1.0.0",
                style: AppFonts.s13w400.copyWith(color: AppColors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
