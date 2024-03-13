import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/constants/consts.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';
import 'package:rick_and_morty/features/widgets/back_btn.dart';
import 'package:rick_and_morty/features/widgets/edit_image_btn.dart';
import 'package:rick_and_morty/features/widgets/personal_info_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
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

  String? imgPath;
  void openDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColors.white,
              content: SizedBox(
                height: 100,
                width: 20,
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          pickIm(source: ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Camera",
                          style:
                              AppFonts.s16w500.copyWith(color: AppColors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          pickIm(source: ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Gallery",
                          style:
                              AppFonts.s16w500.copyWith(color: AppColors.black),
                        )),
                  ],
                ),
              ),
            ));
  }

  Future<void> pickIm({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        imgPath = image.path;
        openDialog();
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
                  // Image.file(
                  //   imgPath != null ? File(imgPath) : null,
                  //   width: 150,
                  // ),
                  const SizedBox(
                    height: 21,
                  ),
                  EditImageBtn(
                    onPressed: () async {
                      openDialog();
                      
                    },
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
              subtitle: "$name $lastName",
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
