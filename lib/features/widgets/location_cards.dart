import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';
import 'package:rick_and_morty/features/location/presentation/pages/location_info_page.dart';

import '../../core/config/theme/app_colors.dart';

class LocationCards extends StatelessWidget {
  final String text;
  final String title;
  final String type;
  const LocationCards({
    super.key,
    required this.text,
    required this.title,
    required this.type
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LocationInfoPage(type: type, name: title, dimension: text,))),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.26,
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  Images.earth,
                  fit: BoxFit.scaleDown,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.s20w500.copyWith(color: AppColors.white),
                  ),
                  Text(
                    text,
                    style: AppFonts.s12w400.copyWith(color: AppColors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
