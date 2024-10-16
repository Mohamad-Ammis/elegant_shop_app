
import 'package:elegant_shop_app/features/auth/register/presentation/views/widgets/register_image_section.dart';
import 'package:elegant_shop_app/features/auth/register/presentation/views/widgets/register_info_section.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [RegisterImageSection(), RegisterInfoSection()],
    );
  }
}
