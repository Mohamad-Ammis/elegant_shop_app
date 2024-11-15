import 'dart:developer';
import 'package:elegant_shop_app/core/utils/extensions.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/custom_search_textfield.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();
  late ProductCubit productCubit;
  @override
  void initState() {
    productCubit = context.read<ProductCubit>();
    _scrollController.addListener(_scroll);
    super.initState();
  }

  _scroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (productCubit.state is ProductLoading ||
          productCubit.state is ProductPaginationLoading) {
        log("state Loading");
        return;
      } else {
        log("reach max of products List");
        //when reach end we have 2 state ,
        //first we must check if we are not using category because there are no pagination in category api
        if (productCubit.hasNext) {
          //first state we have search text so use search api
          if (productCubit.searchText.isNotEmpty) {
            log("call pagination product search api");
            productCubit.searchProducts(fromPagination: true);
          }
          //second state we haven't search text so use all products api
          else {
            log("call pagination product api");
            
            productCubit.getAllProducts(fromPagination: true);
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Column(
              children: [
                24.verticalSizedBox,
                const HomeViewAppbar(),
                24.verticalSizedBox,
                const CustomSearchTextFiled(),
                40.verticalSizedBox,
                const CategoriesListView(),
                8.verticalSizedBox,
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: ProductsGridView(),
          ),
        ),
      ],
    );
  }
}
