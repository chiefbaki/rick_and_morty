
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';

class PlayBtn extends StatelessWidget {
  const PlayBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blue,
            shape: const CircleBorder(),
          ),
          child: const Icon(
            Icons.play_arrow_rounded,
            size: 80,
          )),
    );
  }
}
