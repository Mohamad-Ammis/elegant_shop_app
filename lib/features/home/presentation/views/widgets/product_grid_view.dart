import 'dart:developer';

import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/widgets/custom_empty_state_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/product_cubit/product_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_card.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_shimmer_card.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/products_loading_shimmer_grid_view.dart';
import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = context.read<ProductCubit>();
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductFailure) {
          return CustomErrorWidget(title: state.errMessage);
        } else if (state is ProductSuccess ||
            state is ProductPaginationLoading ||
            state is ProductPaginationFailure) {
          return productCubit.products.isEmpty
              ? const CustomEmptyStateWidget(
                  title: 'Sorry There is no products ')
              : StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: state is ProductPaginationLoading
                      ? productCubit.products.length + 1
                      : productCubit.products.length,
                  itemBuilder: (context, index) {
                    return index < productCubit.products.length
                        ? GestureDetector(
                            onTap: () async {
                              log(userInfo.getString('auth_token').toString());
                              context.push(AppRouter.kProductDetailsView,
                                  extra:
                                      productCubit.products[index].absoluteUrl);
                            },
                            child: ProductCard(
                              product: productCubit.products[index],
                            ),
                          )
                        : const ProductShimmerCard();
                  },
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isOdd ? 4.0 : 3.4),
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 17.0,
                );
        } else {
          return const ProductsLoadingShimmerGridView();
        }
      },
    );
  }
}
