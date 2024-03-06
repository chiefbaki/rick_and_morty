import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/config/router/app_router.dart';
import 'package:rick_and_morty/core/config/settings/dio_settings.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/features/main/domain/character_impl.dart';
import 'package:rick_and_morty/features/main/domain/character_usecase.dart';
import 'package:rick_and_morty/features/main/presentation/cubits/character_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => CharacterUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => CharacterImpl(
              useCase: RepositoryProvider.of<CharacterUseCase>(context)),
        ),
      ],
      child: BlocProvider(
        create: (context) => CharacterCubit(
            repository: RepositoryProvider.of<CharacterImpl>(context)),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false,
              appBarTheme: const AppBarTheme(
                  elevation: 0, backgroundColor: AppColors.darkTheme),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: AppColors.textFieldColor),
              scaffoldBackgroundColor: AppColors.darkTheme),
          routerConfig: AppRouter().config(),
        ),
      ),
    );
  }
}
