import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/router/app_router.gr.dart';
import 'package:rick_and_morty/core/utils/resources/resources.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> routing() async {
    Future.delayed(const Duration(seconds: 3), () {
      context.router.push(const DashboardRoute());
    });
  }

  @override
  void initState() {
    super.initState();
    routing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              Images.splashText,
              height: 452,
              width: 327,
            ),
            const Spacer(),
            Image.asset(
              Images.splash,
              width: 421,
              height: 327,
            ),
          ],
        ),
      ),
    );
  }
}
