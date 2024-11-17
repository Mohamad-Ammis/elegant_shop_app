import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/widgets/navigation_drawer.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Future.wait([
      context.read<ProductCubit>().getAllProducts(),
      context.read<CategoryCubit>().getAllCategories(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Colors.white,
      onRefresh: () {
        context.read<ProductCubit>().page = 1;
        context.read<ProductCubit>().products.clear();
        return Future.wait([
          context.read<ProductCubit>().getAllProducts(),
          context.read<CategoryCubit>().getAllCategories(),
        ]);
      },
      child: const Scaffold(
        drawer: CustomNavigationDrawer(),
        backgroundColor: kBackgroundColor,
        body: HomeViewBody(),
      ),
    );
  }
}
