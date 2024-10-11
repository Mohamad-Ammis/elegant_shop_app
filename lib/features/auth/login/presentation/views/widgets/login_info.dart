import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/auth/login/presentation/views/widgets/login_form.dart';
import 'package:elegant_shop_app/features/auth/widgets/auth_footer.dart';
import 'package:elegant_shop_app/features/auth/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMainPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSizedBox,
          AuthHeader(
            title: 'Welcome Back !',
            subTitle: 'Sign in to your account ',
          ),
          30.verticalSizedBox,
          const LoginForm(),
          8.verticalSizedBox,
          AuthFooter(
            title: 'Don\'t have an account ?',
            specialWord: ' Register',
            routePath: AppRouter.kRegisterView,
          ),
        ],
      ),
    );
  }
}
