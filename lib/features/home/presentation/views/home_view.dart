import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/navigation_drawer.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_body.dart';
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
    return Scaffold(
      bottomNavigationBar: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductPaginationFailure) {
            return SizedBox(
                height: 50,
                child: CustomErrorWidget(
                  title: state.errMessage,
                  hasAnimation: false,
                ));
          } else {
            return const SizedBox();
          }
        },
      ),
      drawer: const CustomNavigationDrawer(),
      backgroundColor: kBackgroundColor,
      body: const HomeViewBody(),
    );
  }
}
