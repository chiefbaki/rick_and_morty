import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_colors.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/app_fonts.dart';

Color setColor({required String text}) {
    if (text == "Alive") {
      return AppColors.green;
    } else if (text == "Dead") {
      return AppColors.red;
    } else if(text == "unknown") {
      return AppColors.grey;
    }else{
      return AppColors.blue;
    }
}


