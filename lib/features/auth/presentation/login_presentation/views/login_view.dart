import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
          slivers: [SliverFillRemaining(child: LoginViewBody())]),
    );
  }
}
