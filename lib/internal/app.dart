import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkTheme
        ),
        scaffoldBackgroundColor: AppColors.darkTheme
      ),
      routerConfig: AppRouter().config(),
    );
  }
}