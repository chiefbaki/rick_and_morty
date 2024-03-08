// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:rick_and_morty/core/config/router/dashboard.dart' as _i2;
import 'package:rick_and_morty/core/config/router/splash_page.dart' as _i12;
import 'package:rick_and_morty/features/auth/presentation/pages/sign_in_page.dart'
    as _i10;
import 'package:rick_and_morty/features/auth/presentation/pages/sign_up_page.dart'
    as _i11;
import 'package:rick_and_morty/features/episode/presentation/episode_page.dart'
    as _i4;
import 'package:rick_and_morty/features/location/presentation/pages/location_info_page.dart'
    as _i5;
import 'package:rick_and_morty/features/location/presentation/pages/location_page.dart'
    as _i6;
import 'package:rick_and_morty/features/main/presentation/pages/character_info_page.dart'
    as _i1;
import 'package:rick_and_morty/features/main/presentation/pages/main_page.dart'
    as _i7;
import 'package:rick_and_morty/features/settings/presentation/pages/edit_info_page.dart'
    as _i3;
import 'package:rick_and_morty/features/settings/presentation/pages/personal_info_page.dart'
    as _i8;
import 'package:rick_and_morty/features/settings/presentation/pages/settings_page.dart'
    as _i9;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    CharacterInfoRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CharacterInfoPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    EditInfoRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditInfoPage(),
      );
    },
    EpisodeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EpisodePage(),
      );
    },
    LocationInfoRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LocationInfoPage(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LocationPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainPage(),
      );
    },
    PersonalInfoRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PersonalInfoPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SettingsPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterInfoPage]
class CharacterInfoRoute extends _i13.PageRouteInfo<void> {
  const CharacterInfoRoute(String name, {List<_i13.PageRouteInfo>? children})
      : super(
          CharacterInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterInfoRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditInfoPage]
class EditInfoRoute extends _i13.PageRouteInfo<void> {
  const EditInfoRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EditInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditInfoRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EpisodePage]
class EpisodeRoute extends _i13.PageRouteInfo<void> {
  const EpisodeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EpisodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LocationInfoPage]
class LocationInfoRoute extends _i13.PageRouteInfo<void> {
  const LocationInfoRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LocationInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationInfoRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LocationPage]
class LocationRoute extends _i13.PageRouteInfo<void> {
  const LocationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PersonalInfoPage]
class PersonalInfoRoute extends _i13.PageRouteInfo<void> {
  const PersonalInfoRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PersonalInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalInfoRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SettingsPage]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<void> {
  const SignInRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
