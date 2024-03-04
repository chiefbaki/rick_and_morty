import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/config/theme/app_colors.dart';
import 'package:rick_and_morty/core/config/theme/app_fonts.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MainRoute(),
        LocationRoute(),
        EpisodeRoute(),
        SettingsRoute()
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
            backgroundColor: AppColors.darkTheme,
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.darkTheme,
              selectedLabelStyle:
                  AppFonts.s12w400,
                  selectedItemColor: AppColors.green,
                  showUnselectedLabels: true,
                  unselectedItemColor: AppColors.grey,
              unselectedLabelStyle:
                  AppFonts.s12w400,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                // here we switch between tabs
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    label: 'Персонажи',
                    icon: SvgPicture.asset(
                      Images.character,
                      color: tabsRouter.activeIndex == 0
                          ? AppColors.green
                          : AppColors.grey,
                    )),
                BottomNavigationBarItem(
                    label: 'Локациии',
                    icon: SvgPicture.asset(Images.location,
                        color: tabsRouter.activeIndex == 1
                            ? AppColors.green
                            : AppColors.grey)),
                BottomNavigationBarItem(
                    label: 'Эпизоды',
                    icon: SvgPicture.asset(Images.episode,
                        color: tabsRouter.activeIndex == 2
                            ? AppColors.green
                            : AppColors.grey)),
                BottomNavigationBarItem(
                    label: 'Настройки',
                    icon: SvgPicture.asset(Images.settings,
                        color: tabsRouter.activeIndex == 3
                            ? AppColors.green
                            : AppColors.grey)),
              ],
            ));
      },
    );
  }
}
