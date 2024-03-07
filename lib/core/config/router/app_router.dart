import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
        ),
        AutoRoute(page: DashboardRoute.page, children: [
          AutoRoute(page: MainRoute.page, initial: true),
          AutoRoute(
            page: LocationRoute.page,
          ),
          AutoRoute(page: EpisodeRoute.page),
          AutoRoute(
            page: SettingsRoute.page,
          ),
        ]),
        AutoRoute(page: LocationInfoRoute.page,),
        AutoRoute(
          page: PersonalInfoRoute.page,
        ),
        AutoRoute(
          page: EditInfoRoute.page,
        ),
        AutoRoute(page: CharacterInfoRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(
          page: SignUpRoute.page,
        ),
      ];
}
