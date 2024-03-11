// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/cupertino.dart' as _i16;
import 'package:flutter/material.dart' as _i15;
import 'package:rick_and_morty/core/config/router/dashboard.dart' as _i2;
import 'package:rick_and_morty/core/config/router/splash_page.dart' as _i13;
import 'package:rick_and_morty/features/auth/presentation/pages/sign_in_page.dart'
    as _i11;
import 'package:rick_and_morty/features/auth/presentation/pages/sign_up_page.dart'
    as _i12;
import 'package:rick_and_morty/features/episode/presentation/pages/episode_info_page.dart'
    as _i4;
import 'package:rick_and_morty/features/episode/presentation/pages/episode_page.dart'
    as _i5;
import 'package:rick_and_morty/features/location/presentation/pages/location_info_page.dart'
    as _i6;
import 'package:rick_and_morty/features/location/presentation/pages/location_page.dart'
    as _i7;
import 'package:rick_and_morty/features/main/presentation/pages/character_info_page.dart'
    as _i1;
import 'package:rick_and_morty/features/main/presentation/pages/main_page.dart'
    as _i8;
import 'package:rick_and_morty/features/settings/presentation/pages/edit_info_page.dart'
    as _i3;
import 'package:rick_and_morty/features/settings/presentation/pages/personal_info_page.dart'
    as _i9;
import 'package:rick_and_morty/features/settings/presentation/pages/settings_page.dart'
    as _i10;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    CharacterInfoRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterInfoRouteArgs>(
          orElse: () => const CharacterInfoRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CharacterInfoPage(
          key: args.key,
          name: args.name,
          gender: args.gender,
          species: args.species,
          status: args.status,
          img: args.img,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    EditInfoRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EditInfoPage(),
      );
    },
    EpisodeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeInfoRouteArgs>(
          orElse: () => const EpisodeInfoRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EpisodeInfoPage(
          key: args.key,
          name: args.name,
          series: args.series,
          date: args.date,
        ),
      );
    },
    EpisodeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.EpisodePage(),
      );
    },
    LocationInfoRoute.name: (routeData) {
      final args = routeData.argsAs<LocationInfoRouteArgs>(
          orElse: () => const LocationInfoRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LocationInfoPage(
          key: args.key,
          name: args.name,
          dimension: args.dimension,
          type: args.type,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LocationPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MainPage(),
      );
    },
    PersonalInfoRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PersonalInfoPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SettingsPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharacterInfoPage]
class CharacterInfoRoute extends _i14.PageRouteInfo<CharacterInfoRouteArgs> {
  CharacterInfoRoute({
    _i15.Key? key,
    String? name,
    String? gender,
    String? species,
    String? status,
    String? img,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CharacterInfoRoute.name,
          args: CharacterInfoRouteArgs(
            key: key,
            name: name,
            gender: gender,
            species: species,
            status: status,
            img: img,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterInfoRoute';

  static const _i14.PageInfo<CharacterInfoRouteArgs> page =
      _i14.PageInfo<CharacterInfoRouteArgs>(name);
}

class CharacterInfoRouteArgs {
  const CharacterInfoRouteArgs({
    this.key,
    this.name,
    this.gender,
    this.species,
    this.status,
    this.img,
  });

  final _i15.Key? key;

  final String? name;

  final String? gender;

  final String? species;

  final String? status;

  final String? img;

  @override
  String toString() {
    return 'CharacterInfoRouteArgs{key: $key, name: $name, gender: $gender, species: $species, status: $status, img: $img}';
  }
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditInfoPage]
class EditInfoRoute extends _i14.PageRouteInfo<void> {
  const EditInfoRoute({List<_i14.PageRouteInfo>? children})
      : super(
          EditInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditInfoRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EpisodeInfoPage]
class EpisodeInfoRoute extends _i14.PageRouteInfo<EpisodeInfoRouteArgs> {
  EpisodeInfoRoute({
    _i16.Key? key,
    String? name,
    String? series,
    String? date,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          EpisodeInfoRoute.name,
          args: EpisodeInfoRouteArgs(
            key: key,
            name: name,
            series: series,
            date: date,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodeInfoRoute';

  static const _i14.PageInfo<EpisodeInfoRouteArgs> page =
      _i14.PageInfo<EpisodeInfoRouteArgs>(name);
}

class EpisodeInfoRouteArgs {
  const EpisodeInfoRouteArgs({
    this.key,
    this.name,
    this.series,
    this.date,
  });

  final _i16.Key? key;

  final String? name;

  final String? series;

  final String? date;

  @override
  String toString() {
    return 'EpisodeInfoRouteArgs{key: $key, name: $name, series: $series, date: $date}';
  }
}

/// generated route for
/// [_i5.EpisodePage]
class EpisodeRoute extends _i14.PageRouteInfo<void> {
  const EpisodeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          EpisodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LocationInfoPage]
class LocationInfoRoute extends _i14.PageRouteInfo<LocationInfoRouteArgs> {
  LocationInfoRoute({
    _i15.Key? key,
    String? name,
    String? dimension,
    String? type,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LocationInfoRoute.name,
          args: LocationInfoRouteArgs(
            key: key,
            name: name,
            dimension: dimension,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationInfoRoute';

  static const _i14.PageInfo<LocationInfoRouteArgs> page =
      _i14.PageInfo<LocationInfoRouteArgs>(name);
}

class LocationInfoRouteArgs {
  const LocationInfoRouteArgs({
    this.key,
    this.name,
    this.dimension,
    this.type,
  });

  final _i15.Key? key;

  final String? name;

  final String? dimension;

  final String? type;

  @override
  String toString() {
    return 'LocationInfoRouteArgs{key: $key, name: $name, dimension: $dimension, type: $type}';
  }
}

/// generated route for
/// [_i7.LocationPage]
class LocationRoute extends _i14.PageRouteInfo<void> {
  const LocationRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MainPage]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PersonalInfoPage]
class PersonalInfoRoute extends _i14.PageRouteInfo<void> {
  const PersonalInfoRoute({List<_i14.PageRouteInfo>? children})
      : super(
          PersonalInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalInfoRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<void> {
  const SignInRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SignUpPage]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
