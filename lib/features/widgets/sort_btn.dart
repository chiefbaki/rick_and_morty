import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';

class SortBtn extends StatelessWidget {
  final String img;
  final Function() onPressed;
  const SortBtn({
    super.key, required this.img, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed, icon: Image.asset(img, color: AppColors.grey,));
  }
}
