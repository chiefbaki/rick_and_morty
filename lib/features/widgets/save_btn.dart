import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

class CustomElevatedBtn extends StatelessWidget {
  final Function() onPressed;
  final String label;
  const CustomElevatedBtn({
    super.key,
    required this.onPressed,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.059,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            label,
            style: AppFonts.s16w400.copyWith(color: AppColors.white),
          )),
    );
  }
}
