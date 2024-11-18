import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/widgets/login_form.dart';
import 'package:elegant_shop_app/features/auth/widgets/auth_footer.dart';
import 'package:elegant_shop_app/features/auth/widgets/auth_header.dart';
import 'package:flutter/material.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(kMainPagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSizedBox,
            const AuthHeader(
              title: 'Welcome Back !',
              subTitle: 'Sign in to your account ',
            ),
            30.verticalSizedBox,
            const LoginForm(),
            8.verticalSizedBox,
            const AuthFooter(
              title: 'Don\'t have an account ?',
              specialWord: ' Register',
              routePath: AppRouter.kRegisterView,
            ),
          ],
        ),
      ),
    );
  }
}
