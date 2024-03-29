import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rick_and_morty/core/config/router/app_router.dart';
import 'package:rick_and_morty/core/config/settings/dio_settings.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/dark_theme.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/src/light_theme.dart';
import 'package:rick_and_morty/core/utils/extensions/theme/theme_manager.dart';
import 'package:rick_and_morty/core/utils/services/shared_prefs.dart';
import 'package:rick_and_morty/features/auth/cubit/auth_cubit.dart';
import 'package:rick_and_morty/features/auth/domain/auth_impl.dart';
import 'package:rick_and_morty/features/auth/domain/auth_usecase.dart';
import 'package:rick_and_morty/features/episode/domain/episode_impl.dart';
import 'package:rick_and_morty/features/episode/domain/episode_usecase.dart';
import 'package:rick_and_morty/features/episode/presentation/cubit/episode_cubit.dart';
import 'package:rick_and_morty/features/location/domain/location_impl.dart';
import 'package:rick_and_morty/features/location/domain/location_usecase.dart';
import 'package:rick_and_morty/features/location/presentation/cubit/location_cubit_cubit.dart';
import 'package:rick_and_morty/features/location/presentation/provider/location_provider.dart';
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
            create: (context) => EpisodeUseCase(
                dio: RepositoryProvider.of<DioSettings>(context).dio)),
        RepositoryProvider(
            create: (context) => EpisodeImpl(
                useCase: RepositoryProvider.of<EpisodeUseCase>(context))),
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
        RepositoryProvider(
          create: (context) => AuthUseCase(),
        ),
        RepositoryProvider(
          create: (context) =>
              AuthImpl(useCase: RepositoryProvider.of<AuthUseCase>(context)),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EpisodeCubit(
                repository: RepositoryProvider.of<EpisodeImpl>(context)),
          ),
          BlocProvider(
            create: (context) => CharacterCubit(
                repository: RepositoryProvider.of<CharacterImpl>(context)),
          ),
          BlocProvider(
            create: (context) => LocationCubit(
                repository: RepositoryProvider.of<LocationImpl>(context)),
          ),
          BlocProvider(
            create: (context) =>
                AuthCubit(repository: RepositoryProvider.of<AuthImpl>(context)),
          ),
        ],
        child: MultiProvider(
          providers: <SingleChildWidget>[
            ChangeNotifierProvider(create: (_) => ThemeManager()),
            ChangeNotifierProvider(create: (_) => LocationProvider()),
            ChangeNotifierProvider(create: (_) => SharedPrefs()),
          ],
          child: Builder(builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: context.watch<ThemeManager>().getCurretnTheme,
              routerConfig: AppRouter().config(),
            );
          }),
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   ThemeManager themeManager = ThemeManager();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       theme: lightTheme,
//       themeMode: themeManager.getThemeMode,
//       darkTheme: darkTheme,
//       routerConfig: AppRouter().config(),
//     );
//   }
// }
