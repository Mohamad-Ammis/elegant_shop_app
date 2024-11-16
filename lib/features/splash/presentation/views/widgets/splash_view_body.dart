// ignore_for_file: use_build_context_synchronously

import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Image.asset(
          width: 200,
          height: 200,
          Assets.imagesLogo,
        ),
        const SizedBox(
          height: 10,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
        const Spacer(),
        Text(
          textAlign: TextAlign.center,
          "Elegant",
          style: Styles.style32Bold.copyWith(color: Colors.white, fontSize: 46),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (userInfo.getBool('first_use') != null) {
        if (userInfo.getString('auth_token') != null) {
          GoRouter.of(context).go(AppRouter.kHomeView);
        } else {
          GoRouter.of(context).go(AppRouter.kLoginView);
        }
      } else {
        GoRouter.of(context).go(AppRouter.kOnBoarding);
      }
    });
  }
}
