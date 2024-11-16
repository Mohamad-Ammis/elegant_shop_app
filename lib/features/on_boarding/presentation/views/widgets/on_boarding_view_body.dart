import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_images.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:elegant_shop_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMainPagePadding),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(.3), BlendMode.darken),
          image: const AssetImage(
            Assets.imagesOnBoarding,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Gentel: Where Style Meets Comfort',
              textAlign: TextAlign.center,
              style: Styles.style32Bold.copyWith(color: Colors.white)),
          8.verticalSizedBox,
          Text('Discover the finest styles, tailored just for you!',
              style: Styles.style16Regular
                  .copyWith(color: const Color(0xff8D8E8E))),
          20.verticalSizedBox,
          CustomButton(
              onTap: () {
                if (userInfo.getString('auth_token') != null) {
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                } else {
                  GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                }
                userInfo.setBool('first_use', false);
              },
              color: Colors.white,
              child: Center(
                child: Text(
                  'Get Started',
                  style: Styles.style18Bold,
                ),
              ))
        ],
      ),
    );
  }
}
