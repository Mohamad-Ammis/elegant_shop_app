
import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/auth/register/presentation/views/widgets/register_form.dart';
import 'package:elegant_shop_app/features/auth/widgets/auth_footer.dart';
import 'package:elegant_shop_app/features/auth/widgets/auth_header.dart';
import 'package:flutter/material.dart';

class RegisterInfoSection extends StatelessWidget {
  const RegisterInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height / 3 - 30,
      child: Container(
        padding: const EdgeInsets.all(kMainPagePadding),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 3 * 3 + 30,
        decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AuthHeader(
                title: 'Welcome ! ',
                subTitle: 'Please enter your data to continue'),
            30.verticalSizedBox,
            const RegisterForm(),
            8.verticalSizedBox,
            const AuthFooter(
              title: 'Already have an account ?',
              specialWord: ' Login',
              routePath: AppRouter.kLoginView,
            ),
          ],
        ),
      ),
    );
  }
}

