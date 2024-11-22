import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/widgets/custom_empty_state_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/cubit/get_all_favorites_products_cubit.dart';
import 'package:elegant_shop_app/features/favorite/presentation/views/widgets/favorite_product_card.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/products_loading_shimmer_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FavoriteViewBody extends StatefulWidget {
  const FavoriteViewBody({super.key});

  @override
  State<FavoriteViewBody> createState() => _FavoriteViewBodyState();
}

class _FavoriteViewBodyState extends State<FavoriteViewBody> {
  late final GetAllFavoritesProductsCubit favoritesProductsCubit;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    favoritesProductsCubit = context.read<GetAllFavoritesProductsCubit>();
    _scrollController.addListener(_scroll);
    super.initState();
  }

  _scroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (favoritesProductsCubit.state is GetAllFavoritesProductsLoading ||
          favoritesProductsCubit.state
              is GetAllFavoritesProductsPaginationLoading) {
        log("state Loading");
        return;
      } else {
        log("reach max of products List");
        if (favoritesProductsCubit.hasNext) {
          log("call pagination product api");
          favoritesProductsCubit.getAllFavoriteProducts(formPagination: true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    GetAllFavoritesProductsCubit cubit =
        context.read<GetAllFavoritesProductsCubit>();
    return BlocBuilder<GetAllFavoritesProductsCubit,
        GetAllFavoritesProductsState>(
      builder: (context, state) {
        return state is GetAllFavoritesProductsSuccess ||
                state is GetAllFavoritesProductsPaginationLoading ||
                state is GetAllFavoritesProductsPaginationFailure
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kMainPagePadding),
                child: cubit.products.isEmpty
                    ? const CustomEmptyStateWidget(
                        title: 'there is no products in favorite')
                    : StaggeredGridView.countBuilder(
                        controller: _scrollController,
                        crossAxisCount: 4,
                        itemCount:
                            state is GetAllFavoritesProductsPaginationLoading
                                ? cubit.products.length + 1
                                : cubit.products.length,
                        itemBuilder: (context, index) {
                          return index < cubit.products.length
                              ? GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).push(
                                        AppRouter.kProductDetailsView,
                                        extra: cubit.products[index].product!
                                            .absoluteUrl);
                                  },
                                  child: FavoriteProductCard(
                                    favoriteProductModel: cubit.products[index],
                                  ),
                                )
                              : const CustomLoadingWidget();
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isOdd ? 3.5 : 3.1),
                        mainAxisSpacing: 24.0,
                        crossAxisSpacing: 17.0,
                      ))
            : state is GetAllFavoritesProductsFailure
                ? CustomErrorWidget(
                    title: state.errMessage,
                    hasRelodButton: true,
                    onTap: () async {
                      favoritesProductsCubit.page = 1;
                      await favoritesProductsCubit.getAllFavoriteProducts();
                    },
                  )
                : const Padding(
                    padding: EdgeInsets.symmetric(horizontal: kMainPagePadding),
                    child: ProductsLoadingShimmerGridView(),
                  );
      },
    );
  }
}
