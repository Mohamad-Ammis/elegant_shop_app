
import 'package:elegant_shop_app/core/utils/app_routes.dart';
import 'package:elegant_shop_app/core/widgets/custom_empty_state_widget.dart';
import 'package:elegant_shop_app/core/widgets/custom_error_widget.dart';
import 'package:elegant_shop_app/features/home/presentation/manger/cubit/get_category_products_cubit.dart';
import 'package:elegant_shop_app/features/home/presentation/views/category_products_view_widgets/category_products_shimmer_grid_view.dart';
import 'package:elegant_shop_app/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class CategoryProductsGridView extends StatelessWidget {
  const CategoryProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryProductsCubit, GetCategoryProductsState>(
      builder: (context, state) {
        return state is GetCategoryProductsSuccess
            ? state.products.isEmpty
                ? const CustomEmptyStateWidget(
                    title: 'Sorry there is no products in this category')
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          context.push(AppRouter.kProductDetailsView,
                              extra: state.products[index].absoluteUrl);
                        },
                        child: ProductCard(
                          product: state.products[index],
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isOdd ? 4.0 : 3.4),
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 17.0,
                  )
            : state is GetCategoryProductsFailure
                ? CustomErrorWidget(title: state.errMessage)
                : const CategoryProductsShimmerGridView();
      },
    );
  }
}
