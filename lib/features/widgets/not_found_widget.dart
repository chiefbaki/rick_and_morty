
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

class NotFoundWidget extends StatelessWidget {
  final String img;
  const NotFoundWidget({
    super.key,
    required this.img
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              width: 150,
              height: 251,
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              "Персонаж с таким именем\nне найден",
              style: AppFonts.s16w400
                  .copyWith(color: AppColors.grey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
