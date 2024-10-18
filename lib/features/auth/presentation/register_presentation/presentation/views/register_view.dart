import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/features/auth/presentation/register_presentation/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: RegisterViewBody(),
          )
        ],
      ),
    );
  }
}
