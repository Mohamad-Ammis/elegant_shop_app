import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/widgets/image_section.dart';
import 'package:elegant_shop_app/features/auth/presentation/login_presentation/views/widgets/info_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(flex: 1, child: LoginImageSection()),
        Expanded(flex: 2, child: InfoSection())
      ],
    );
  }
}
