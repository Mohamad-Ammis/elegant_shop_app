import 'dart:developer';

import 'package:elegant_shop_app/constans.dart';
import 'package:elegant_shop_app/core/utils/service_locator.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_loading_widget.dart';
import 'package:elegant_shop_app/features/favorite/data/repos/favorite_repo_implementation.dart';
import 'package:elegant_shop_app/features/favorite/presentation/manger/cubit/get_all_favorites_products_cubit.dart';
import 'package:elegant_shop_app/features/favorite/presentation/views/widgets/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
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
        //when reach end we have 2 state ,
        //first we must check if we are not using category because there are no pagination in category api
        if (favoritesProductsCubit.hasNext) {
          //first state we have search text so use search api

          //second state we haven't search text so use all products api

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
                state is GetAllFavoritesProductsPaginationLoading
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kMainPagePadding),
                child: StaggeredGridView.countBuilder(
                  controller: _scrollController,
                  crossAxisCount: 4,
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    return FavoriteProductCard(
                      favoriteProductModel: cubit.products[index],
                    );
                  },
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isOdd ? 3.5 : 3.1),
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 17.0,
                ))
            : state is GetAllFavoritesProductsFailure
                ? CustomErrorWidget(title: state.errMessage)
                : CustomLoadingWidget();
      },
    );
  }
}
