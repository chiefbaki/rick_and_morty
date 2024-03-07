import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/config/router/app_router.dart';
import 'package:rick_and_morty/core/config/settings/dio_settings.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/features/location/domain/location_impl.dart';
import 'package:rick_and_morty/features/location/domain/location_usecase.dart';
import 'package:rick_and_morty/features/location/presentation/cubit/location_cubit_cubit.dart';
import 'package:rick_and_morty/features/character/domain/character_impl.dart';
import 'package:rick_and_morty/features/character/domain/character_usecase.dart';
import 'package:rick_and_morty/features/character/presentation/cubits/character_cubit.dart';
import 'package:rick_and_morty/features/location/presentation/provider/location_provider.dart';

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
            create: (context) => LocationUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio)),
        RepositoryProvider(
            create: (context) => LocationImpl(
                useCase: RepositoryProvider.of<LocationUseCase>(context))),
        RepositoryProvider(
          create: (context) => CharacterUseCase(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => CharacterImpl(
              useCase: RepositoryProvider.of<CharacterUseCase>(context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharacterCubit(
                repository: RepositoryProvider.of<CharacterImpl>(context)),
          ),
          BlocProvider(
            create: (context) => LocationCubit(
                repository: RepositoryProvider.of<LocationImpl>(context)),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (context) => LocationProvider(),
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
      ),
    );
  }
}
