import 'package:elegant_shop_app/features/auth/register/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: RegisterViewBody(),
          )
        ],
      ),
    );
  }
}
