import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/navigation_drawer.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomNavigationDrawer(),
      backgroundColor: kBackgroundColor,
      body: HomeViewBody(),
    );
  }
}
