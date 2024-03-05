import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

@RoutePage()
class LocationInfoPage extends StatelessWidget {
  const LocationInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              Images.earth1,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,

              decoration: BoxDecoration(
                color: AppColors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
