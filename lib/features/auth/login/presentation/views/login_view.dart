import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/auth/login/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff8E6CEF),
      body: CustomScrollView(
          slivers: [SliverFillRemaining(child: LoginViewBody())]),
    );
  }
}
