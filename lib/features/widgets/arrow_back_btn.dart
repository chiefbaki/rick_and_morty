
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';

class ArrowBackBtn extends StatelessWidget {
  final Function() onPressed;
  const ArrowBackBtn({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.keyboard_arrow_right_outlined,
          color: AppColors.white,
        ));
  }
}

