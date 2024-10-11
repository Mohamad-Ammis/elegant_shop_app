import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_styles.dart';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/auth/login/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';

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
          Text(
            'Welcome Back !',
            style: Styles.style32Bold,
          ),
          Text(
            textAlign: TextAlign.center,
            'Sign in to your account ',
            style: Styles.style12Regular.copyWith(color: kSubTitleColor),
          ),
          30.verticalSizedBox,
          const LoginForm(),
          8.verticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Don\'t have an account ?',
                style: Styles.style12Regular.copyWith(color: kSubTitleColor),
              ),
              GestureDetector(
                child: Text(
                  textAlign: TextAlign.center,
                  ' Register',
                  style: Styles.style12Bold.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
